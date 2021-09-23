#!/bin/bash

# Fix VMware Customization Issues KB56409
sudo sed -i '/^\[Unit\]/a After=dbus.service' /lib/systemd/system/open-vm-tools.service
sudo awk 'NR==11 {$0="#D /tmp 1777 root root -"} 1' /usr/lib/tmpfiles.d/tmp.conf | sudo tee /usr/lib/tmpfiles.d/tmp.conf

# https://kb.vmware.com/s/article/82229  solved problems with same IP on multible vm's in vpshere by packer
sudo echo -n > /etc/machine-id
sudo rm /var/lib/dbus/machine-id
sudo ln -s /etc/machine-id /var/lib/dbus/machine-id


# Disable Cloud Init
sudo touch /etc/cloud/cloud-init.disabled


