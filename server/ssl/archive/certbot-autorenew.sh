wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
sudo mv certbot-auto /etc/letsencrypt
echo "Installation of certbot auto complete. Copy the next setting and place it in the cron tab."
echo "45 2 * * 6 cd /etc/letsencrypt/ && ./certbot-auto renew"
echo "Press enter to edit cron tab."
read
sudo crontab -e
