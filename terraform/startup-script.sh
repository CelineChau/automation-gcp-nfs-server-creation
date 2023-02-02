#!/bin/bash

FILE=startup.txt
if [ ! -f "$FILE" ]; then
    # Startup script trace
    touch startup.txt
    # Create shared directory
    mkdir -p /mnt/data
    # Format disk
    sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
    # Mount disk
    sudo mount -o discard,defaults /dev/sdb /mnt/data
    # Add permissions
    sudo chmod a+w /mnt/data
    # Backup
    sudo cp /etc/fstab /etc/fstab.backup
    export UUID=`sudo blkid -s UUID -o value /dev/sdb`
    sudo bash -c "echo 'UUID=$UUID /mnt/data ext4 discard,defaults 0 2' >> /etc/fstab"
fi