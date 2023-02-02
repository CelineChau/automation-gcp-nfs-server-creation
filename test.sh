#!/bin/bash

sudo apt update

# Install the NFS server
sudo apt install -y nfs-kernel-server

# Shared NFS directory
sudo mkdir -p /mnt/nfs_share

# Set directory permissions
sudo chown -R nobody:nogroup /mnt/nfs_share

# Set file permissions
sudo chown 777 /mnt/nfs_share

# Grant nfs access
sudo bash -c "echo '/mnt/nfs_share 10.128.0.0/9(rw,sync,no_subtree_check)' >> /etc/exports"

# Export NFS directory
sudo exportfs -a

# Restart NFS server
sudo systemctl restart nfs-kernel-server

# Grant firewall access
# sudo ufw allow from 10.128.0.0/9 to any port nfs

# Enable firewall
# sudo ufw enable

# Check firewall status
# sudo ufw status

# Generer image avec packer

# Packer provisionner

