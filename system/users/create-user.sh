echo 'Are you sure you want to create a new user?'
read createuser
if [ $createuser == 'y' ] || [ $createuser == 'Y' ];
then
echo 'Creating new user'
sudo adduser
else
echo 'Exiting'
fi
