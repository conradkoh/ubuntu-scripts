echo "Type the name of the device you wish to mount:"
lsblk
read volume
echo "Type the path to mount the volume to:"
read path
mount /dev/"$volume" "$path"
