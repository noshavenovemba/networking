!/bin/bash/
#podman

sudo yum install podman
podman run -d --name postgresql_database -e POSTGRESQL_USER=user -e POSTGRESQL_PASSWORD=pass -e POSTGRESQL_DATABASE=db -p 5432:5432 rhscl/postgresql-96-rhel7
podman ps
podman start $cid
