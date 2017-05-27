docker load < apache2php-dockerimg.tar
docker run -it --name=webhost -p 80:80 -v /shared:/host apache2-php /bin/bash
