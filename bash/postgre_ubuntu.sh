#!/bin/bash/	
#postgres on ubuntu
  
  docker run -d --name postgres-container -e TZ=UTC -p 30432:5432 -e POSTGRES_PASSWORD=My:s3Cr3t/ ubuntu/postgres:14-22.04_beta

	docker network create postgres-network

	docker network connect postgres-network postgres-container

	docker run -it --rm --network postgres-network ubuntu/postgres:14-22.04_beta psql -h postgres-container -U postgres
