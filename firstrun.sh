#!/bin/bash
# based on the instructions from edk2-platform
# do this first:
# https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt
set -e

cd ../edk2
git submodule deinit -f --all
git clean -ffxd
git checkout tags/edk2-stable202508 -b build-compat-2025
git submodule update --init --recursive

cd ../edk2-platforms
git fetch origin
git checkout $(git rev-list -n 1 --before="2025-08-22" origin/master)
git submodule update --init --recursive

cd ../edk2-exynos850

. build_common.sh
make -C ../edk2/BaseTools

