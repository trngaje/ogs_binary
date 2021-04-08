#!/bin/bash

mkdir update_kernel
cd update_kernel

echo delete previous binaries
rm 9pv3kernel.tar.gz*
rm Image
rm rk3326-odroidgo*.dtb
echo download kernel and modules


wget -O 9pkernel.md5 https://github.com/trngaje/ogs_binary/raw/master/9pv3kernel/9pkernel.md5
wget -O 9pv3kernel.tar.gzaa https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/9pv3kernel.tar.gzaa?raw=true
wget -O 9pv3kernel.tar.gzab https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/9pv3kernel.tar.gzab?raw=true
wget -O Image https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/Image?raw=true
wget -O rk3326-odroidgo2-linux-rgv.dtb https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/rk3326-odroidgo2-linux-rgv.dtb?raw=true
wget -O rk3326-odroidgo2-linux-rk.dtb https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/rk3326-odroidgo2-linux-rk.dtb?raw=true
wget -O rk3326-odroidgo2-linux-v11.dtb https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/rk3326-odroidgo2-linux-v11.dtb?raw=true
wget -O rk3326-odroidgo2-linux.dtb https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/rk3326-odroidgo2-linux.dtb?raw=true
wget -O rk3326-odroidgo3-linux.dtb https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/rk3326-odroidgo3-linux.dtb?raw=true

md5sum --status --check 9pkernel.md5
Result=$?
echo checksumResult:$Result

if [ $Result = "0" ]
then
    echo "checksum:OK"
else
    echo "checksum:FAIL!"
    exit 1
fi

echo mount boot partition
mkdir -p boot_real
sudo mount -o rw /dev/mmcblk0p1 ./boot_real

echo extract modules and copy kernel
cat 9pv3kernel.tar.gz* | sudo tar --same-owner -zxvf - -C /

sudo cp -v Image ./boot_real/
sudo cp -v rk3326-odroidgo*.dtb ./boot_real/

sync
sudo umount ./boot_real

rm 9pkernel.md5
rm 9pv3kernel.tar.gz*
rm Image
rm rk3326-odroidgo*.dtb
rm -d boot_real
cd ..
rm -d update_kernel

echo completed
 
