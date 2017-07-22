#check if package is installed
if [ $(dpkg-query -W -f='${Status}' samba 2>/dev/null | grep -c "ok installed") ];
then
sudo apt-get update
sudo apt-get install samba -y
fi
echo "Enter your username"
read username
sudo smbpasswd -a $username
