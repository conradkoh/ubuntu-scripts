samba_filename="smb.conf"
echo "Save to file?"
read should_save
if [ $should_save == 'y' ];
then
	echo "Enter directory:"
	read directory
	if [ -d $directory ];
	then	
	sudo cp /etc/samba/smb.conf $directory$samba_filename
	fi
fi
