sudo usermod -aG docker %USERNAME%

docker search tomcat

docker pull tomcat // download image from remote

docker build mytestbuild .

docker run -it -p 80800:3000 d2cc7b04fb0a // interactive mode

docker run -d mytestbuild // run as a daemon

sudo docker run -it --rm --network postgres-network ubuntu/postgres:14-22.04_beta psql -h postgres-container_s3Cr3t -U postgres

docker run --name myapache -d -p 80:80 apache_image:1.0

docker ps -a

docker stop 

docker -rmi // delete image

docker prune // delete all images

.dockerignore - file, that defines the Docker build context, you can specify ignore rules and exceptions from these rules for files and folder
