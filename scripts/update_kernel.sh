#!/bin/bash

mkdir update_kernel
cd update_kernel
echo download kernel and modules

wget https://github.com/trngaje/ogs_binary/kernel/kernel.tar.gz*
wget https://github.com/trngaje/ogs_binary/kernel/Image
wget https://github.com/trngaje/ogs_binary/kernel/rk3326-odroidgo3-linux.dtb

echo mount boot partition
mkdir -p boot_real
sudo mount -o rw /dev/mmcblk0p1 ./boot_real

echo extract modules and copy kernel
cat kernel.tar.gz* | sudo tar --same-owner -zxvf -C / -

sudo cp -v Image ./boot_real/
sudo cp -v rk3326-odroidgo3-linux.dtb ./boot_real/

sync
umount ./boot_real

echo completed
 
