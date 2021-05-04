/* linux/arch/arm/plat-s3c24xx/common-smdk.c
 *
 * Copyright (c) 2006 Simtec Electronics
 *	Ben Dooks <ben@simtec.co.uk>
 *
 * Common code for SMDK2410 and SMDK2440 boards
 *
 * http://www.fluff.org/ben/smdk2440/
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/interrupt.h>
#include <linux/list.h>
#include <linux/timer.h>
#include <linux/init.h>
#include <linux/sysdev.h>
#include <linux/platform_device.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/mtd/partitions.h>

#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/irq.h>

#include <asm/mach-types.h>
#include <asm/hardware.h>
#include <asm/io.h>
#include <asm/irq.h>

#include <asm/arch/regs-gpio.h>
#include <asm/arch/leds-gpio.h>

#include <asm/arch/nand.h>

#include <asm/plat-s3c24xx/common-smdk.h>
#include <asm/plat-s3c24xx/devs.h>
#include <asm/plat-s3c24xx/pm.h>
#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
#include <linux/dm9000.h>
#endif
#ifdef CONFIG_SERIAL_EXTEND_S3C24xx
#include <linux/serial_8250.h>
#endif
#ifdef CONFIG_TOUCHSCREEN_S3C2410
#include <asm/plat-s3c24xx/ts.h>
#endif

/* LED devices */
static struct resource led_resource[] = {
    [0] = {
        .start = 0x56000010,             /* TQ2440的LED是GPB5,6,7,8, GPBCON地址是0x56000010 */
        .end   = 0x56000010 + 8 - 1,
        .flags = IORESOURCE_MEM,
    },
    [1] = {
        .start = 5,                      /* LED1 */
        .end   = 5,
        .flags = IORESOURCE_IRQ,
    }

};

static void led_release(struct device * dev)
{
}

static struct platform_device led_dev = {
	.name     		= "myled",
	.id       		= -1,
	.num_resources  = ARRAY_SIZE(led_resource),
	.resource       = led_resource,
	.dev = {
		.release = led_release,
	},
};

/* NAND parititon from 2.4.18-swl5 */

static struct mtd_partition smdk_default_nand_part[] = {
	[0] = {
        .name   = "bootloader",
        .size   = 0x00040000,
		.offset	= 0,
	},
	[1] = {
        .name   = "params",
        .offset = MTDPART_OFS_APPEND,
        .size   = 0x00020000,
	},
	[2] = {
        .name   = "kernel",
        .offset = MTDPART_OFS_APPEND,
        .size   = 0x00200000,
	},
	[3] = {
        .name   = "root",
        .offset = MTDPART_OFS_APPEND,
        .size   = 0x06400000,
	},
	[4] = {
        .name   = "nand_test",
        .offset = MTDPART_OFS_APPEND,
        .size   = MTDPART_SIZ_FULL,
	},
};

static struct s3c2410_nand_set smdk_nand_sets[] = {
	[0] = {
		.name		= "NAND",
		.nr_chips	= 1,
		.nr_partitions	= ARRAY_SIZE(smdk_default_nand_part),
		.partitions	= smdk_default_nand_part,
	},
};

/* choose a set of timings which should suit most 512Mbit
 * chips and beyond.
*/

static struct s3c2410_platform_nand smdk_nand_info = {
	.tacls		= 20,
	.twrph0		= 60,
	.twrph1		= 20,
	.nr_sets	= ARRAY_SIZE(smdk_nand_sets),
	.sets		= smdk_nand_sets,
};

#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
/* DM9000 */
static struct resource s3c_dm9k_resource[] = {
    [0] = {
        .start = S3C2410_CS4,       /* ADDR2=0，发送地址时使用这个地址 */
        .end   = S3C2410_CS4 + 3,
        .flags = IORESOURCE_MEM,
    },
    [1] = {
        .start = S3C2410_CS4 + 4,   /* ADDR2=1，传输数据时使用这个地址 */
        .end   = S3C2410_CS4 + 4 + 3,
        .flags = IORESOURCE_MEM,
    },
    [2] = {
        .start = IRQ_EINT7,         /* 中断号 */
        .end   = IRQ_EINT7,
        .flags = IORESOURCE_IRQ,
    }

};

/* for the moment we limit ourselves to 16bit IO until some
 * better IO routines can be written and tested
*/

static struct dm9000_plat_data s3c_dm9k_platdata = {
    .flags      = DM9000_PLATF_16BITONLY,
};

static struct platform_device s3c_device_dm9k = {
    .name       = "dm9000",
    .id     = 0,
    .num_resources  = ARRAY_SIZE(s3c_dm9k_resource),
    .resource   = s3c_dm9k_resource,
    .dev        = {
        .platform_data = &s3c_dm9k_platdata,
    }
};
#endif /* CONFIG_DM9000 */

/* for extend serial chip, www.100ask.net */
#ifdef CONFIG_SERIAL_EXTEND_S3C24xx
static struct plat_serial8250_port s3c_device_8250_data[] = {
    [0] = {
        .mapbase    = 0x28000000,
        .irq        = IRQ_EINT17,
        .flags      = (UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_SHARE_IRQ),
        .iotype     = UPIO_MEM,
        .regshift   = 0,
        .uartclk    = 14745600, // 115200*16,
    },
    [1] = {
        .mapbase    = 0x29000000,
        .irq        = IRQ_EINT18,
        .flags      = (UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_SHARE_IRQ),
        .iotype     = UPIO_MEM,
        .regshift   = 0,
        .uartclk    = 14745600, // 115200*16,
    },
    { }
};

static struct platform_device s3c_device_8250 = {
    .name           = "serial8250",
    .id             = 0,
    .dev            = {
        .platform_data  = &s3c_device_8250_data,
    },
};

#endif

#ifdef CONFIG_TOUCHSCREEN_S3C2410
static struct s3c2410_ts_mach_info s3c2410_ts_cfg = {
        .delay = 10000,
        .presc = 49,
        .oversampling_shift = 2,
};
#endif

/* devices we initialise */

static struct platform_device __initdata *smdk_devs[] = {
	&s3c_device_nand,
	&led_dev,
#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
    &s3c_device_dm9k,
#endif
#ifdef CONFIG_SERIAL_EXTEND_S3C24xx
    &s3c_device_8250,
#endif
#ifdef CONFIG_TOUCHSCREEN_S3C2410
	&s3c_device_ts,
#endif
};

void __init smdk_machine_init(void)
{
	/* Configure the LEDs (even if we have no LED support)*/

	if (machine_is_smdk2443())
		smdk_nand_info.twrph0 = 50;

	s3c_device_nand.dev.platform_data = &smdk_nand_info;
#ifdef CONFIG_TOUCHSCREEN_S3C2410
	set_s3c2410ts_info(&s3c2410_ts_cfg);
#endif
	platform_add_devices(smdk_devs, ARRAY_SIZE(smdk_devs));

	s3c2410_pm_init();
}
