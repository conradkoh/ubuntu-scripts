route -n
echo "Enter the destination:"
read destination
echo "Enter the gateway:"
read gateway
echo "Enter the Genmask:"
read netmask
echo "Enter the iface:"
read iface

route del -net $destination gw $gateway netmask $netmask dev $iface
echo "route del -net $destination gw $gateway netmask $netmask dev $iface" >> /etc/rc.local
