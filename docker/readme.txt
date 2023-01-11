sudo usermod -aG docker %USERNAME%

docker search tomcat

docker scan tomcat // scan snyk for vulnerabilities

docker pull tomcat // download image from remote

docker build mytestbuild .

DOCKER_CONTENT_TRUST=1 // to verify the integrity and authenticity of an image

hadolint Dockerfile // scan dockerfile for syntax

HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1 

docker run --cpus=2 -m 512m nginx

docker run -it -p 80800:3000 d2cc7b04fb0a // interactive mode

docker run -d mytestbuild // run as a daemon

docker tag mytestbuild mytag

docker exec -it d2cc7b04fb0a /bin/bash // echo "another string" >> /var/www/index.html

docker commit d2cc7b04fb0a mytestbuild:v2

sudo docker run -it --rm --network postgres-network ubuntu/postgres:14-22.04_beta psql -h postgres-container_s3Cr3t -U postgres

docker run --name myapache -d -p 80:80 apache_image:1.0

docker --name mynginx --rm -d $PWD:/usr/share/nginx/html.index // volumne map

docker ps -a

docker container inspect 

docker stop 

docker rm // delete container

docker rmi // delete image

docker prune // delete all images

.dockerignore - file, that defines the Docker build context, you can specify ignore rules and exceptions from these rules for files and folder

docker run -v $PWD:/usr/share/nginx/html -p 8080:80 -d nginx

docker logs
