echo "Enter the address of the key to remove"
read key
ssh-keygen -R $key
