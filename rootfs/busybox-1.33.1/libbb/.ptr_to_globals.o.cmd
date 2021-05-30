cmd_libbb/ptr_to_globals.o := arm-linux-gcc -Wp,-MD,libbb/.ptr_to_globals.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.33.1"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"ptr_to_globals"'  -DKBUILD_MODNAME='"ptr_to_globals"' -c -o libbb/ptr_to_globals.o libbb/ptr_to_globals.c

deps_libbb/ptr_to_globals.o := \
  libbb/ptr_to_globals.c \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/features.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/sys/cdefs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/wordsize.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/gnu/stubs.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/bits/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/linux/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm-generic/errno.h \
  /usr/local/arm/4.4.3/bin/../arm-none-linux-gnueabi//sys-root/usr/include/asm-generic/errno-base.h \

libbb/ptr_to_globals.o: $(deps_libbb/ptr_to_globals.o)

$(deps_libbb/ptr_to_globals.o):
