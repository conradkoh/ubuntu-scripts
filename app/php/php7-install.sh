apt-get update
apt-get remove php5-common -y
apt-get purge php5-common -y
apt-get install php7.0 -y
apt-get install php-xml php-curl php-zip php-gd php-mbstring php-xmlrpc php-soap php-intl -y
apt-get install libapache2-mod-php -y #install the php apache extension
