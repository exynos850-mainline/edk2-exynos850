#!/bin/bash
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
