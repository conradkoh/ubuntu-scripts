docker images
echo "Enter the name of the image that you would like to start"
read image_name
#static name
server_name="SERVER"
echo "Enter the path to a volume you would like to share with this instance"
read host_path 
guest_path="/shared"
docker run -it -v "$host_path":"$guest_path" --name=$server_name -p 80:80 $image_name '/bin/bash'
