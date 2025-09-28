#!/bin/bash

ASM=nasm

BOOT_DIR=/home/pietr0davila/Documents/OS_development/boot
BOOT_FILE=$BOOT_DIR/boot.nasm
BUILD_DIR=/home/pietr0davila/Documents/OS_development/build
DEVICE=/home/pietr0davila/Documents/OS_development/out/device.img
BOOT_BIN=/home/pietr0davila/Documents/OS_development/out/boot.bin
QEMU=qemu-system-i386

$ASM $BOOT_FILE -f bin -o $BOOT_BIN
mv $BOOT_BIN $DEVICE
$QEMU -drive format=raw,file=$DEVICE
