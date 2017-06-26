apt-get update
apt-get install pkg-config -y
apt-get install libcurl4-openssl-dev pkg-config libssl-dev libsslcommon2-dev -y
pecl install mongodb
echo 'Installation completed. You should add "extension=mongodb.so" to php.ini';
echo 'Get open the php.ini file? (y/n)'
read open
if [[ "$open"=='y' || "$open"=='Y' ]];
then
vim /etc/php/7.0/apache2/php.ini
fi
