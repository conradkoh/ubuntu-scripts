echo 'Enter the username of the user you would like to delete:'
read username
echo 'Are you sure you want to delete this user? (y/n)'
read confirmed
if [ $confirmed == 'y' ] || [ $confirmed == 'Y' ];
then 
	echo 'Would you like to delete the home directory and all its contents for the user? (y/n)'
	read deleteall
	sudo userdel $username
	if [ $deleteall == 'y' ] || [ $deleteall == 'Y' ];
	then
	deletedir="/home/$username/"
	echo $deletedir	
	sudo rm -r $deletedir
	fi
else
	echo 'Exiting'
fi
