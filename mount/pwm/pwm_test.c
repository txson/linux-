
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(int argc, char **argv)
{
	int fd;
	int value = 50;

	fd = open("/dev/pwm", O_RDWR);
	if (fd < 0)
	{
		printf("can't open /dev/dev\n");
		return -1;
	}
	else
	{
		printf("open /dev/pwm success \n");
	}


	if (0 == memcmp(argv[1], "pwm_freq", 8))
	{
		value = atoi(argv[2]);
		printf("freq:%s\n", argv[2]);
		if (ioctl(fd, 1, value) == 0)
		{
			printf("set freq success \n");
		}
		else
		{
			printf("set freq fail \n");
		}
	}
	else if (0 == memcmp(argv[1], "pwm_stop", 8))
	{
		if (ioctl(fd, 0, value) == 0)
		{
			printf("set stop success \n");
		}
		else
		{
			printf("set stop fail \n");
		}
	}
	else if (0 == memcmp(argv[1], "pwm_start", 9))
	{
		if (ioctl(fd, 2, value) == 0)
		{
			printf("set start success \n");
		}
		else
		{
			printf("set start fail \n");
		}
	}
	else
	{
		printf("wrong cmd \n");
	}

	sleep(5);
//	while(1);
	close(fd);
	return 0;
}

