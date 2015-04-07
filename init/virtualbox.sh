#!/bin/bash

sudo apt-get install -y build-essential module-assistant linux-headers-$(uname -r)
sudo m-a prepare
echo -e "\nMount Virtualbox Guest Additions via app or manually with \n\t'sudo blkid'\n\t'sudo mount /dev/BLKID /mnt/cdrom'\n\t'cd /mnt/cdrom'\n\t'sudo ./VBoxLinuxAdditions.run'"
