#!/bin/bash
#
# Run with script with
# -sd <SD card image file> to have a SD card loaded
# -kernel <kernel uImage file> to have a kernel preloaded in ARM
#

base=$(dirname $0)

echo Starting in $base

name_nand="$base/mini2440_nand64.bin"

if [ ! -f "$name_nand" ]; then
	echo "$0 : creating NAND empty image : $name_nand"
	dd if=/dev/zero of="$name_nand" bs=528 count=131072
#	dd if=/dev/zero of="$name_nand" bs=528 count=127100
	echo "** NAND file created - make sure to 'nand scrub' and 'nand createbbt' in u-boot"
fi

cmd="qemu-system-arm -M mini2440 $* \
	-serial stdio \
	-mtdblock "$name_nand" \
	-kernel uImage \
	-net nic \
	-net tap,ifname=tap0,script=no,downscript=no"

#	-monitor telnet::5555,server,nowait \
cmd2="qemu-system-arm -M mini2440 $* \
	-kernel $base/uImage \
	-serial stdio \
	-mtdblock "$name_nand" \
	-show-cursor \
	-usb -usbdevice keyboard \
	-usbdevice mouse \
	-net nic,vlan=0 \
	-net tap,ifname=tap0,script=no,downscript=no"

# echo $cmd
# echo $cmd2
$cmd2
