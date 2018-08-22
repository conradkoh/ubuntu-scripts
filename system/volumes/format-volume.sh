set -e
echo "Enter the volume which you wish to format:"
lsblk
read volume_short
device_name="/dev/""$volume_short"

echo "Checking volume ($device_name) status..."
op=$(sudo file -s "$device_name")
unformatted_op="$device_name"": data"
wrongdisk_op="$device_name: cannot open \`$device_name' (No such file or directory)"


if [[ "$op" == "$wrongdisk_op" ]]
then
	echo "Please check that the disk specified exists. Exiting.."
	exit
fi


if [[ "$op" == "$unformatted_op" ]] 
then 
	echo "Found one unformatted volume: $device_name. Are you sure you want to format this volume? (y/n)"
	read confirm
	if [[ "$confirm" == "y" ]] 
	then
		sudo mkfs -t ext4 "$device_name"
		echo "Please enter a mount point for this device."
		read mountpoint
		sudo mkdir "$mountpoint"
		sudo mount "$device_name" "$mountpoint"
	fi
else
	echo "Volume already formatted. Exiting.."
fi
