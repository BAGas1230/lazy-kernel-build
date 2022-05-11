#! /bin/bash

# Kernel Repo
KERNEL_REPO=https://"${GITHUB_USER}":"${GITHUB_TOKEN}"@github.com/BAGas1230/kernel_xiaomi_sm6250-5

# Kernel Branch
KERNEL_BRANCH=LA.UM.8.9.r1-10600-SM6xx.0

# The name of the device for which the kernel is built
MODEL="Asus Zenfone Max Pro M1"

# The codename of the device
DEVICE="X00TD"

# The defconfig which should be used. Get it from config.gz from
# your device or check source
DEFCONFIG=cust_defconfig

# Show manufacturer info
MANUFACTURERINFO="ASUSTek Computer Inc."

# Kernel Variant
NAMA=Signature

JENIS=Mark

VARIAN=iii

# Build Type
BUILD_TYPE="Nightly"

# Specify compiler.
# 'clang' or 'clangxgcc' or 'gcc' or 'gcc49' , 'linaro & 'gcc2'
COMPILER=clang

# Message on anykernel when installation
MESSAGE="Salam dari kota congyang"

# KBUILD ENV
K_USER=Thoreck
K_HOST=Android_builder
K_VERSION=636


# arch & subarch
K_ARCH=arm64
K_SUBARCH=arm64
