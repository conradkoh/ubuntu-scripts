docker run -it --name=TransposerDB -p 27017:27017 -p 27018:27018 -p 27019:27019 -p 28017:28017 -v /shared:/shared -v /mnt/data/transposer/transposer_db:/data/db ubuntu /bin/bash
