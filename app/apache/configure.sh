default_conf_path="/etc/apache2/sites-available/000-default.conf"
apache_conf_path="/etc/apache2/apache2.conf"

echo "To change the default location of the root folder, modify the /etc/apache2/sites-available/000-default.conf file"
echo "If you are getting a 403 forbidden error, modify the /etc/apache2/apache2.conf file, and create an entry with the following text:"
echo "<Directory /var/www>
	DirectoryIndex index.php    
	Options Indexes FollowSymLinks
	AllowOverride None
	Require all granted
      </Directory>"

echo "To prevent listing of the directory, remove the Indexes option"

echo "Continue? (y/n)"
read should_continue
if [[ $should_continue == "y" || $should_continue == "Y" ]]
then
	vim $default_conf_path;
	vim $apache_conf_path
else
echo "exiting"
fi

