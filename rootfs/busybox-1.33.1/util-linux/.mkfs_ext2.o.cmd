cmd_util-linux/mkfs_ext2.o := arm-linux-gcc -Wp,-MD,util-linux/.mkfs_ext2.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.33.1"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"mkfs_ext2"'  -DKBUILD_MODNAME='"mkfs_ext2"' -c -o util-linux/mkfs_ext2.o util-linux/mkfs_ext2.c

deps_util-linux/mkfs_ext2.o := \
  util-linux/mkfs_ext2.c \
    $(wildcard include/config/mke2fs.h) \
    $(wildcard include/config/mkfs/ext2.h) \
    $(wildcard include/config/mkfs/ext3.h) \
    $(wildcard include/config/feature/mkfs/ext2/reserved/gdt.h) \
    $(wildcard include/config/feature/mkfs/ext2/dir/index.h) \
    $(wildcard include/config/feature/clean/up.h) \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/selinux.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/variable/arch/pagesize.h) \
    $(wildcard include/config/feature/verbose.h) \
    $(wildcard include/config/feature/etc/services.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/float/duration.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/syslog/info.h) \
    $(wildcard include/config/warn/simple/msg.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/ash.h) \
    $(wildcard include/config/sh/is/ash.h) \
    $(wildcard include/config/bash/is/ash.h) \
    $(wildcard include/config/hush.h) \
    $(wildcard include/config/sh/is/hush.h) \
    $(wildcard include/config/bash/is/hush.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/test1.h) \
    $(wildcard include/config/test2.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/killall5.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/feature/setpriv/capabilities.h) \
    $(wildcard include/config/run/init.h) \
    $(wildcard include/config/feature/securetty.h) \
    $(wildcard include/config/pam.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/shell/ash.h) \
    $(wildcard include/config/shell/hush.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/devfs.h) \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /usr/local/arm/4.4.3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.3/include-fixed/limits.h \
  /usr/local/arm/4.4.3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.3/include-fixed/syslimits.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/limits.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/features.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/cdefs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/wordsize.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/gnu/stubs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/posix1_lim.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/local_lim.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/limits.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/posix2_lim.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/xopen_lim.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/stdio_lim.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/byteswap.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/byteswap.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/endian.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/endian.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/stdint.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/wchar.h \
  /usr/local/arm/4.4.3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.3/include/stdbool.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/unistd.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/posix_opt.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/environments.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/types.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/typesizes.h \
  /usr/local/arm/4.4.3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.3/include/stddef.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/confname.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/getopt.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/ctype.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/xlocale.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/dirent.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/dirent.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm-generic/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm-generic/errno-base.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/fcntl.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/fcntl.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/types.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/time.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/select.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/select.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sigset.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/time.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/sysmacros.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/pthreadtypes.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/uio.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/stat.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/stat.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/inttypes.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/netdb.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/netinet/in.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/socket.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/uio.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/socket.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sockaddr.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/socket.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/sockios.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/in.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/rpc/netdb.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/siginfo.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/netdb.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/setjmp.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/setjmp.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/signal.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/signum.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sigaction.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sigcontext.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/sigcontext.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sigstack.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/ucontext.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/procfs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/time.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/user.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sigthread.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/paths.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/stdio.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/libio.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/_G_config.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/wchar.h \
  /usr/local/arm/4.4.3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.3/include/stdarg.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/sys_errlist.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/stdlib.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/waitflags.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/waitstatus.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/alloca.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/string.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/libgen.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/poll.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/poll.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/poll.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/ioctl.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/ioctls.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/ioctls.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/ioctl.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm-generic/ioctl.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/ioctl-types.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/ttydefaults.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/mman.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/mman.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/resource.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/resource.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/wait.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/termios.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/termios.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/param.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/param.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/param.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/pwd.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/grp.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/mntent.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/statfs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/statfs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/utmp.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/utmp.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/utmpx.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/utmpx.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/arpa/inet.h \
  include/pwd_.h \
  include/grp_.h \
  include/shadow_.h \
  include/xatonum.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/fs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/ioctl.h \
  include/bb_e2fs_defs.h \

util-linux/mkfs_ext2.o: $(deps_util-linux/mkfs_ext2.o)

$(deps_util-linux/mkfs_ext2.o):
