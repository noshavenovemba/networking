--------- sudo usermod -aG docker %USERNAME% ---------
.dockerignore - file, that defines the Docker build context, you can specify ignore rules and exceptions from these rules for files and folder
hadolint Dockerfile // scan dockerfile for syntax
DOCKER_CONTENT_TRUST=1 // to verify the integrity and authenticity of an image
HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1 // check that container is working
HEALTHCHECK // specify the signal that will be used to stop the container
label, workdir // don't add a layer to dockerfile

docker build <name> .
docker search <name>
docker pull <name> // download image from remote
docker scan <name> // scan for vulnerabilities
docker commit d2cc7b04fb0a mytestbuild:v2 // changes to the image
docker run --cpus=2 -m 512m <name>
docker run -it -p 80800:3000 <id> // interactive mode
docker run --name <containername> -d <name> // run as a daemon
docker run -v $PWD:/usr/share/nginx/html -p 8080:80 -d <name> // volume
docker run -it --rm --network postgres-network ubuntu/postgres:14-22.04_beta psql -h postgres-container_s3Cr3t -U postgres
docker --name <name> --rm -d $PWD:/usr/share/nginx/html.index // volumne map
docker tag <name> mytag
docker container inspect 
docker logs
docker stats // runtime cpu, memory network IO
docker exec -it <id> /bin/bash // echo "another string" >> /var/www/index.html
docker ps -a
docker stop 
docker rmi // delete image
docker prune // delete all images
docker rm // delete container
docker namespaces // adds a layer of isolation in containers

docker-compose up
docker-compose up -d
docker-compose down // delete containers
