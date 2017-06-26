# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
apt-get update
apt-get install -y --no-install-recommends software-properties-common
echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update && apt-get install -y mongodb-org
mkdir -p /data/db
/usr/bin/mongod & #start the service
