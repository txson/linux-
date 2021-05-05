#include <common.h>
#include <command.h>

int do_my_cmd (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	printf("Hello word.\n");
	return 0;
}

U_BOOT_CMD(
	my_cmd,	5,	1,	do_my_cmd,
	"hello word \n",
	"long hello word\n"
);

