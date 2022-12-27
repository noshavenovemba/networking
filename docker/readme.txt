docker build .

docker run -p 3000:3000 d2cc7b04fb0a

docker run -it node #(interactive session)

sudo docker run -it --rm --network postgres-network ubuntu/postgres:14-22.04_beta psql -h postgres-container_s3Cr3t -U postgres

docker run --name myapache -d -p 80:80 apache_image:1.0

docker ps #(list all containers)

docker ps -a

docker stop 

docker pull #(download from remote to local)

docker -rmi // delete image

docker prune // delete all images
