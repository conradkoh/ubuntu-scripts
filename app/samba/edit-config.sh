name="edit-config"
readme_ext=".readme"
readme_file=$name$readme_ext
cat $readme_file

echo "Edit the samba config file? (y/n)"
read cont
if [ $cont == 'y' ];
then
	echo "Editing configuration file"
	sudo vim /etc/samba/smb.conf 
fi

