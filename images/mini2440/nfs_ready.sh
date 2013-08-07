#/bin/bash
# install nfs tool
sudo apt-get install nfs-kernel-server tunctl

# sudo echo "/srv/nfsroot/ *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

sudo exportfs -r
sudo /etc/init.d/nfs-kernel-server restart 

# set tap0 
sudo tunctl -u $USER -t tap0
sudo ifconfig tap0 192.168.123.1
