KERN_DIR = /home/raoxu/Desktop/linux_learn/linux-/linux-2.6.22.6

all:
	make -C $(KERN_DIR) M=`pwd` modules

clean:
	make -C $(KERN_DIR) M=`pwd` modules clean
	rm -rf modules.order

obj-m	+= first_drv.o
