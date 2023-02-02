# Install NFS client
sudo apt install nfs-common

# Shared client NFS directory
sudo mkdir -p /mnt/nfs_clientshare

# Mount NFS share 
sudo mount 10.0.2.15:/mnt/nfs_share /mnt/nfs_clientshare
