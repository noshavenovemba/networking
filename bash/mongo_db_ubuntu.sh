!/bin/bash/
#mongodb ubuntu

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10</span>

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

sudo apt-get update

sudo apt-get install -y mongodb-org

#sudo vim /etc/systemd/system/mongodb.service
##Unit contains the dependencies to be satisfied before the service is started.
#[Unit]
#Description=MongoDB Database
#After=network.target
#Documentation=https://docs.mongodb.org/manual
## Service tells systemd, how the service should be started.
## Key `User` specifies that the server will run under the mongodb user and
## `ExecStart` defines the startup command for MongoDB server.
#[Service]
#User=mongodb
#Group=mongodb
#ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf
## Install tells systemd when the service should be automatically started.
## `multi-user.target` means the server will be automatically started during boot.
#[Install]
#WantedBy=multi-user.target

systemctl daemon-reload

sudo systemctl start mongodb

netstat -plntu

sudo systemctl status mongodb

sudo systemctl enable mongodb

mongo

#use admin
#db.createUser({user:"admin", pwd:”password", roles:[{role:"root", db:"admin"}]})
#mongo -u admin -p admin123 --authenticationDatabase admin
#show dbs
