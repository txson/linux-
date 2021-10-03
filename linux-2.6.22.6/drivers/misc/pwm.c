#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/poll.h>
#include <linux/interrupt.h>
#include <linux/device.h>
#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/ioport.h>
#include <linux/platform_device.h>
#include <linux/delay.h>
#include <linux/err.h>
#include <linux/slab.h>
#include <linux/clk.h>
#include <asm/arch/regs-timer.h>
#include <asm/arch/regs-gpio.h>
//#include <asm/arch/time.h>
#include <asm/io.h>
#include <asm/hardware.h>
#include <asm/arch/regs-clock.h>

#define DEVICE_NAME    "pwm"

#define PWM_IOCTL_START 	            2    //����pwm��Ƶ��
#define PWM_IOCTL_SET_FREQ              1    //����pwm��Ƶ��
#define PWM_IOCTL_STOP                  0    //ֹͣpwm

//�����ź������˴����ź�����һ�������ź���������PWM�豸֮��ֻ�ܱ�һ�����̴�
static struct semaphore lock;


/* freq:  pclk/50/16/65536 ~ pclk/50/16
 * if pclk = 50MHz, freq is 1Hz to 62500Hz
 * human ear : 20Hz~ 20000Hz��Ҫ�ǶԲ���pwm�ļĴ����������ã������������һ�������ǿ��Կ������������������üĴ������ǲ��ö����޸ġ�д�ķ�ʽ���еġ�
 */
static void PWM_Set_Freq( unsigned long freq )
{
	unsigned long tcon;
	unsigned long tcnt;
	unsigned long tcfg1;
	unsigned long tcfg0;
	struct clk *clk_p;
	unsigned long pclk;

	//set GPB0 as tout0, pwm output
	s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPB0_TOUT0);//����GPB0Ϊtout0,pwm���
	tcon  = __raw_readl(S3C2410_TCON);         //��ȡ�Ĵ���TCON��tcon
	tcfg1 = __raw_readl(S3C2410_TCFG1);        //��ȡ�Ĵ���TCFG1��tcfg1
	tcfg0 = __raw_readl(S3C2410_TCFG0);        //��ȡ�Ĵ���TCFG0��tcfg0

	//prescaler = 50
	//���prescaler 0 [7:0]λ
	tcfg0 &= ~S3C2410_TCFG_PRESCALER0_MASK;  // S3C2410_TCFG_PRESCALER0_MASK��ʱ��0��1��Ԥ��Ƶֵ�����룬TCFG[0~8]
	//����prescaler 0 [7:0]λ
	tcfg0 |= (50 - 1);   // Ԥ��ƵΪ50HZ

	//mux = 1/16 ��ϸ�뿴�����ֲ�
	tcfg1 &= ~S3C2410_TCFG1_MUX0_MASK;     //S3C2410_TCFG1_MUX0_MASK��ʱ��0�ָ�ֵ�����룺TCFG1[0~3]

	tcfg1 |= S3C2410_TCFG1_MUX0_DIV16;    //��ʱ��0����16�ָ�
	__raw_writel(tcfg1, S3C2410_TCFG1);   //��������tcfg1��ֵд���ָ�Ĵ���S3C2410_TCFG1��
	__raw_writel(tcfg0, S3C2410_TCFG0);   //��tcfg0��ֵд��Ԥ��Ƶ�Ĵ���S3C2410_TCFG0��

	clk_p = clk_get(NULL, "pclk");       //�õ�pclk
	pclk = clk_get_rate(clk_p);
	tcnt = (pclk/50/16)/freq;           //�õ���ʱ��������ʱ�ӣ���������PWM�ĵ���Ƶ��

	__raw_writel(tcnt, S3C2410_TCNTB(0));   //PWM������Ƶ�Ƶ�ʵ��ڶ�ʱ��������ʱ��
	__raw_writel(tcnt/2, S3C2410_TCMPB(0)); //ռ�ձ���50% ,�Լ���Ϊ�Ǹߵ�ƽʱ��

	//���ö�ʱ��
	tcon &= ~0x1f;//���ǰ4λ
	tcon |= 0xb;   //disable deadzone, auto-reload, inv-off, update TCNTB0&TCMPB0, start timer 0
	__raw_writel(tcon, S3C2410_TCON);

	tcon &= ~2;    //clear manual update bit
	__raw_writel(tcon, S3C2410_TCON);   //��tconд�����������ƼĴ���S3C2410_TCON��
}

static void PWM_Stop(void)
{
	s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPIO_OUTPUT); //����GPB0Ϊ���
	s3c2410_gpio_setpin(S3C2410_GPB0, 0); //����GPB0Ϊ�͵�ƽ��ʹ������ֹͣ
}

static void PWM_Start(void)
{
	s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPIO_OUTPUT); //����GPB0Ϊ���
	s3c2410_gpio_setpin(S3C2410_GPB0, 1); //����GPB0Ϊ�͵�ƽ��ʹ������ֹͣ
}

static int s3c24xx_pwm_open(struct inode *inode, struct file *file)
{
	printk("open pwm beep \n");
	if (!down_trylock(&lock))//�ж��Ƿ��豸�Ѿ��򿪣��Ѵ򿪷���EBUSY
		return 0;           //�Ƿ����ź�������down_trylock(&lock��=0�������0
	else
		return -EBUSY;
}

static int s3c24xx_pwm_close(struct inode *inode, struct file *file)
{
	printk("close pwm beep \n");
	PWM_Stop();//ֹͣPWM
	up(&lock);//�ͷ��ź���
	return 0;
}

/*���pwm�����Ļ�������������ioctl�����Ͽ��Կ�����ֻ�ṩ����ѡ�һ��������Ƶ�ʣ�����PWM_Set_Freq��������һ����ֹͣ�������Ĺ��ܶ�û�У������������������� ���ṩ���ƶ������ṩ���ԡ���˼�룬����������ֻ�ṩ�����Ĺ���ʵ�֣��������ӵĹ�����Ӧ�ó����ṩ��*/

static int s3c24xx_pwm_ioctl(struct inode *inode, struct file *file, unsigned int cmd, unsigned long arg)
{
	//printk("ioctl pwm: %x %lx\n", cmd, arg);
	switch (cmd) {
	case PWM_IOCTL_SET_FREQ:
		if (arg == 0){
			return -EINVAL;
		}
		PWM_Set_Freq(arg);//����Ƶ��
		printk("driver set pwm freq :%d \n", arg);
		break;

	case PWM_IOCTL_STOP:
		PWM_Stop();
		printk("driver set pwm stop \n");
		break;

	case PWM_IOCTL_START:
		PWM_Start();
		printk("driver set pwm start \n");
		break;

	default :
		printk("default cmd \n");
		break;
	}
	return 0;
}

/*��ʼ���豸���ļ������Ľṹ��*/
static struct file_operations dev_fops = {
	.owner   =  THIS_MODULE,
	.open    =  s3c24xx_pwm_open,
	.release =  s3c24xx_pwm_close,
	.ioctl   =  s3c24xx_pwm_ioctl,
};

static struct miscdevice misc = {
	.minor = MISC_DYNAMIC_MINOR,
	.name  = DEVICE_NAME,
	.fops  = &dev_fops,
};

/*pwm����Ҳ����Ϊ�����豸ע��ģ�ͬ��Ϊ�˷�ֹ������ɵľ�̬���и��ź���������ģ��ĳ�ʼ����������������ǳ�ʼ����һ���ź�����Ȼ�����misc_registerע�ᵽ�����豸*/
static int __init dev_init(void)
{
	int ret;
	init_MUTEX(&lock);	//��ʼ��һ��������
	ret = misc_register(&misc);
	printk (DEVICE_NAME"\tinitialized\n");
	return ret;
}

static void __exit dev_exit(void)
{
	misc_deregister(&misc);
}

module_init(dev_init);
module_exit(dev_exit);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("FriendlyARM Inc.");
MODULE_DESCRIPTION("S3C2410/S3C2440 PWM Driver");
