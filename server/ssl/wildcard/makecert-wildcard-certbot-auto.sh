echo "Enter the domain name for the certificate:"
read dn

# Set the local variables required
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Execute the certbot script
./certbot-auto certonly --manual -d *.${dn} -d ${dn} --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
