#!/bin/bash
DATE=`date '+%Y%m%d_%H%M%S'`
echo ${DATE}
echo "Choose a device to mount automatically:"
lsblk
read device
echo "Specify a mount point:"
read mount_point
echo "Specify device filesystem:"
read fs
fs_mntops="defaults,nofail" #default settings, do not report errors if device doesn't exist
fs_freq="0" #Do not dump filesystem
fs_passno="2" #Root filesystems have value 1. Others should have value 2
device_name="/dev/""$device"
echo "DEVICE_NAME: $device_name"

status=$(sudo file -s "$device_name")
echo "STATUS: $status";
regex="UUID=([^ ]+)\s"

if [[ "$status" =~ $regex ]]
then
	UUID="${BASH_REMATCH[1]}"
	#Check if this device has already been specified in fstab
	found=$(cat "/etc/fstab" | grep $device_name)
	if [[ ! -z "$found" ]]
	then
		#device already specified
		echo "Device already specified in \"/etc/fstab\". Exiting"
		exit
	else
		#command="$details"" """"$fs_mntops"" ""$fs_freq"" ""$fs_passno"
		command="UUID=$UUID $mount_point $fs $fs_mntops  $fs_freq  $fs_passno"
		echo "COMMAND:"
		echo "$command"
		fstabfile="/etc/fstab"
		backupfstab="/etc/fstab.""${DATE}"
		cp "$fstabfile" "$backupfstab"
		echo "$command" >> "$fstabfile"
	fi
else
	echo "Could not find a device matching $device_name"
fi
