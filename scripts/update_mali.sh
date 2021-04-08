#!/bin/bash

mkdir update_mali
cd update_mali

wget -O libmali-bifrost-g31-rxp0-gbm.so https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/mali/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so?raw=true
wget -O mali.md5 https://github.com/trngaje/ogs_binary/raw/master/9pv3kernel/mali/aarch64-linux-gnu/mali.md5

md5sum --status --check mali.md5
Result=$?

if [ $Result = "0" ]
then
    echo "aarch64-linux-gnu checksum:OK"
else
    echo "aarch64-linux-gnu checksum:FAIL!"
    exit 1
fi

sudo cp libmali-bifrost-g31-rxp0-gbm.so /usr/local/lib/aarch64-linux-gnu/

rm libmali-bifrost-g31-rxp0-gbm.so
rm mali.md5

wget -O libmali-bifrost-g31-rxp0-gbm.so https://github.com/trngaje/ogs_binary/blob/master/9pv3kernel/mali/arm-linux-gnueabihf/libmali-bifrost-g31-rxp0-gbm.so?raw=true
wget -O mali.md5 https://github.com/trngaje/ogs_binary/raw/master/9pv3kernel/mali/arm-linux-gnueabihf/mali.md5

md5sum --status --check mali.md5
Result=$?

if [ $Result = "0" ]
then
    echo "arm-linux-gnueabihf checksum:OK"
else
    echo "arm-linux-gnueabihf checksum:FAIL!"
    exit 1
fi


sudo cp libmali-bifrost-g31-rxp0-gbm.so /usr/local/lib/arm-linux-gnueabihf/

rm libmali-bifrost-g31-rxp0-gbm.so
rm mali.md5

cd ..
rm -d update_mali

echo completed
 
