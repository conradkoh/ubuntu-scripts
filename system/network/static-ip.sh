#vim /etc/network/interfaces
id=`id -u`
if ! [ $id = "0" ];
then
	echo "Access denied. Run this script using sudo." 
	exit
fi
interface_file="/etc/network/interfaces"
echo "Enter your interface name: ";
read ifname
echo "Enter the static ip: "
read ipadd
echo "Enter the gateway: "
read gateway
sudo cp /etc/network/interfaces /etc/network/interfaces-copy
echo $'\n'
echo "auto $ifname" >> $interface_file
echo "iface $ifname inet static" >> $interface_file
echo "address $ipadd" >> $interface_file
echo "netmask 255.255.255.0" >> $interface_file
echo "gateway $gateway" >> $interface_file
sudo ifdown $ifname
sudo ifup $ifname
