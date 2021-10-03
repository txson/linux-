#include"sys/ioctl.h"
#include"stdio.h"
#include"sys/types.h"
#include"sys/stat.h"
#include"fcntl.h"
#include"unistd.h"
#include"string.h"
#include"stdlib.h"
#include <sys/statfs.h>
#include <sys/vfs.h>

int main(int argc,const char *argv[])
{
	FILE *fd;

	unsigned char data[4096] = {0};
	memset(data, 0, sizeof(data));
	memcpy(data, "hello_word\n", 20);

	fd = fopen("/dev/mtd4", O_SYNC|O_RDWR);
	if(fd<0)
	{
		perror("failtoopen\n");
		exit(-1);
	}

	printf("%s\n", argv[0]);
	printf("%s\n", argv[1]);
	printf("%s\n", data);
	fwrite(argv[1], 4096, 1, fd);

	fread(data, 4096, 1, fd);
	printf("%s\n", data);
	printf("%x\n", data[0]);

/*	int stat_flag = 0;
	struct statfs nandflash_stat;
	long hdisk_remainder_space;

	stat_flag = statfs("/dev/mtdblock4", &nandflash_stat);
	printf("stat_flag:%d\n", stat_flag);

	hdisk_remainder_space = (float)nandflash_stat.f_bsize * nandflash_stat.f_bfree / 1024;
	printf("size:%d, free:%d, remain:%d\n", nandflash_stat.f_bsize, nandflash_stat.f_bfree, hdisk_remainder_space);
*/

	return 0;
}

