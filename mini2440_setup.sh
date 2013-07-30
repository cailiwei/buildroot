#!/bin/bash
# install wget tool
echo "Now we will start to build root tree !!!"
echo "Install the Network Tool: wget"
sudo apt-get install wget 

# build root tree acquire the three things: 
# 	1. bootloader(u-boot, supervivi, etc.)
# 	2. linux kernel(uImage, zImage, bzImage, etc.)
# 	3. rootfs(jffs2, yaffs2, etc.)
#
# Defined the board machine: $(BAORD)_defconfig
BAORD=mini2440
if [ "$BAORD" = "mini2440" ]; then
	echo "make ${BAORD}_defconfig"
	make ${BAORD}_defconfig
	echo "make menuconfig"
	make menuconfig
	echo "Begin to build root tree... Save the build info to build.info"
	make | tee build.info
fi
echo "-----------------------------------------------------------------"
echo "HUOHUO, it's the end of building ${BAORD} info!!!"
