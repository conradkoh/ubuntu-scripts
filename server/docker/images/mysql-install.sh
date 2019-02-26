#Pull the latest mysql image
docker pull mysql;

#Read the user's configurations
echo "Please enter the path to the data folder";
read data_folder;

echo "Please enter the default root password";
read root_password;

#Create the docker container
docker run \
-v "$data_folder":/var/lib/mysql \
--detach \
--name=mysql \
--env="MYSQL_ROOT_PASSWORD=$root_password" \
--publish 3306:3306 \
mysql \
--max-connections=200 \
--character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci \

