echo "Showing default configured gateways:"
route | grep default
echo "Enter your new default gateway:"
read gateway
sudo ip route add default via $gateway
