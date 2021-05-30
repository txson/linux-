cmd_libbb/perror_nomsg.o := arm-linux-gcc -Wp,-MD,libbb/.perror_nomsg.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.33.1"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"perror_nomsg"'  -DKBUILD_MODNAME='"perror_nomsg"' -c -o libbb/perror_nomsg.o libbb/perror_nomsg.c

deps_libbb/perror_nomsg.o := \
  libbb/perror_nomsg.c \
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

libbb/perror_nomsg.o: $(deps_libbb/perror_nomsg.o)

$(deps_libbb/perror_nomsg.o):
