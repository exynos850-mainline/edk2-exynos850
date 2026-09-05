#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -j$(nproc) -s -n 0 -a AARCH64 -t GCC5 -p EXYNOS850Pkg/Devices/a13.dsc
cat BootShim/BootShim.bin workspace/Build/EXYNOS850Pkg/DEBUG_GCC5/FV/EXYNOS850PKG_UEFI.fd > workspace/UEFI
touch workspace/empty_ramdisk
mkbootimg --kernel workspace/UEFI --ramdisk empty_ramdisk --dtb resources/a13.dtb --pagesize 2048 --base 0x10000000 --kernel_offset 0x00008000 --dtb_offset 0x00000000 --ramdisk_offset 0x01000000 --second_offset 0xf0000000 --tags_offset 0x00000100 -o workspace/boot.img
cd workspace/
tar -c boot.img -f boot.tar
cd ..
