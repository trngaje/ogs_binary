#!/bin/bash

mkdir update_kernel
cd update_kernel

echo delete previous binaries
rm kernel.tar.gz*
rm Image
rm rk3326-odroidgo3-linux.dtb
echo download kernel and modules


wget -O kernel.tar.gzaa https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzaa?raw=true
wget -O kernel.tar.gzab https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzab?raw=true
wget -O kernel.tar.gzac https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzac?raw=true
wget -O kernel.tar.gzad https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzad?raw=true
wget -O kernel.tar.gzae https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzae?raw=true
wget -O kernel.tar.gzaf https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzaf?raw=true
wget -O kernel.tar.gzag https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzag?raw=true
wget -O kernel.tar.gzah https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzah?raw=true
wget -O kernel.tar.gzai https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzai?raw=true
wget -O kernel.tar.gzaj https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzaj?raw=true
wget -O kernel.tar.gzak https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzak?raw=true
wget -O kernel.tar.gzal https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzal?raw=true
wget -O kernel.tar.gzam https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzam?raw=true
wget -O kernel.tar.gzan https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzan?raw=true
wget -O kernel.tar.gzao https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzao?raw=true
wget -O kernel.tar.gzap https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzap?raw=true
wget -O kernel.tar.gzaq https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzaq?raw=true
wget -O kernel.tar.gzar https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzar?raw=true
wget -O kernel.tar.gzas https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzas?raw=true
wget -O kernel.tar.gzat https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzat?raw=true
wget -O kernel.tar.gzau https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzau?raw=true
wget -O kernel.tar.gzav https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzav?raw=true
wget -O kernel.tar.gzaw https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzaw?raw=true
wget -O kernel.tar.gzax https://github.com/trngaje/ogs_binary/blob/master/kernel/kernel.tar.gzax?raw=true
wget -O Image https://github.com/trngaje/ogs_binary/blob/master/kernel/Image?raw=true
wget -O rk3326-odroidgo3-linux.dtb https://github.com/trngaje/ogs_binary/blob/master/kernel/rk3326-odroidgo3-linux.dtb?raw=true

echo mount boot partition
mkdir -p boot_real
sudo mount -o rw /dev/mmcblk0p1 ./boot_real

echo extract modules and copy kernel
cat kernel.tar.gz* | sudo tar --same-owner -zxvf - -C /

sudo cp -v Image ./boot_real/
sudo cp -v rk3326-odroidgo3-linux.dtb ./boot_real/

sync
sudo umount ./boot_real

rm kernel.tar.gz*
rm Image
rm rk3326-odroidgo3-linux.dtb
rm -d boot_real
cd ..
rm -d update_kernel

echo completed
 
