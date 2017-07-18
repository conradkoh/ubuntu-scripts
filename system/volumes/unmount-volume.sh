echo "Type the mount point of the device. e.g. /mnt/data2"
read mount_path
umount "$mount_path"
