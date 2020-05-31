apt-get update
apt-get install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot

#Connect to domain
echo "Enter your domain name";
read domain;
certbot certonly --standalone -d ${domain}

#Install the data from the 
echo "Installation of certbot auto complete. Copy the next setting and place it in the cron tab."
echo '@monthly certbot renew --standalone --pre-hook "stop yourWebService" --post-hook "start yourWebService"'
echo "Press enter to edit cron tab."
read
sudo crontab -e
