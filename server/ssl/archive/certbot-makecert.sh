echo "Enter the domain name for the certificate:"
read dn
certbot certonly --standalone -d ${dn}
