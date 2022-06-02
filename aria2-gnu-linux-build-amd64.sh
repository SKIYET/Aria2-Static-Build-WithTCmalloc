#!/usr/bin/env bash
#
# Copyright (c) 2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Aria2-Pro-Core
# File name: aria2-gnu-linux-build.sh
# Description: Aria2 ard64 platform build
# System Required: Debian & Ubuntu & Fedora & Arch Linux
# Version: 1.6
#

set -e
[ $EUID != 0 ] && SUDO=sudo
$SUDO echo
SCRIPT_DIR=$(dirname $(readlink -f $0))

## CONFIG ##
ARCH="amd64"
OPENSSL_ARCH="linux-x86_64"
BUILD_DIR="/tmp"
ARIA2_CODE_DIR="$BUILD_DIR/aria2"
OUTPUT_DIR="$HOME/output"
PREFIX="$BUILD_DIR/aria2-build-libs"
ARIA2_PREFIX="/usr/local"
DEFAULT_PREFIX="/usr/local"  #For libunwind conpile.
export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig:${PREFIX}/lib64/pkgconfig"
export LD_LIBRARY_PATH="${PREFIX}/lib:${PREFIX}/lib64"
export PATH="$PREFIX/bin:$HOME/bin${PATH:+:${PATH}}"
export CC="gcc"
export CXX="g++"
export STRIP="strip"
export RANLIB="ranlib"
export AR="ar"
export LD="ld"

## DEPENDENCES ##
source $SCRIPT_DIR/dependences

## TOOLCHAIN ##
source $SCRIPT_DIR/snippet/target-toolchain

TOOLCHAIN() {
    if [ -x "$(command -v apt-get)" ]; then
        DEBIAN_INSTALL
    elif [ -x "$(command -v dnf)" ]; then
        FEDORA_INSTALL
    elif [ -x "$(command -v pacman)" ]; then
        ARCH_INSTALL
    else
        echo -e "This operating system is not supported !"
        exit 1
    fi
}

## BUILD ##
source $SCRIPT_DIR/snippet/target-build

## ARIA2 COEDE ##
source $SCRIPT_DIR/snippet/aria2-code

## ARIA2 BIN ##
source $SCRIPT_DIR/snippet/aria2-bin

## CLEAN ##
source $SCRIPT_DIR/snippet/clean

## BUILD PROCESS ##
TOOLCHAIN
DEPENDENCES_GET
BISON_BUILD
GAWK_BUILD
GLIBC_BUILD
ZLIB_BUILD
EXPAT_BUILD
C_ARES_BUILD
OPENSSL_BUILD
SQLITE3_BUILD
LIBSSH2_BUILD
LIBUNWIND_BUILD
GPERFTOOLS_BUILD
ARIA2_BUILD
#ARIA2_BIN
ARIA2_PACKAGE
#ARIA2_INSTALL
CLEANUP_ALL

echo "finished!"
