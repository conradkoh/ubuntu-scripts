echo 'Enter the username of the user you wish to create'
read username

#check if user already exists
userexists=false

results=`awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd | grep $username`

printf '%s\n' "$results" | while read -r curuser
do 
	if [ "$curuser" == "$username" ];
	then
	echo 'user exists'
	userexists=true
	echo $userexists
	break
	fi
done

if [ $userexists=true ];
then
echo 'A system account for this user exists and will be used.'
sudo smbpasswd -a $username
else
echo 'User does not exist. Create a new system user? (y/n)'
read createsysuser
if [ "$createsysuser" == 'y' ];
sudo adduser --no-create-home --disabled-password --disabled-login $username
sudo smbpasswd -a $username
then
else
echo 'Samba share was not created'
fi
fi
