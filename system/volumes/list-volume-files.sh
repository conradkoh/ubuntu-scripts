lsblk
echo "Enter the name of the volume:"
read vol
file -s /dev/"$vol"
