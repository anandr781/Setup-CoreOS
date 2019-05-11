#!/bin/bash

read -p "Enter installation device : " device_var
wget https://github.com/coreos/container-linux-config-transpiler/releases/download/v0.9.0/ct-v0.9.0-x86_64-unknown-linux-gnu
mv ct-v0.9.0-x86_64-unknown-linux-gnu ct
chmod a+x ct
 
wget  https://raw.githubusercontent.com/anandr781/Setup-CoreOS/master/CoreOS-CloudConfig.yml
./ct --in-file=CoreOS-Consul.yml --out-file=ignition
echo "Shall we continue with CoreOS install ?"
read
sudo coreos-install -d $device_var   -i ignition 
