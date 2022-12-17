#!/bin/bash
#docker installation

#update rhel manager
# subscription-manager register

#setup repository
sudo yum install -y yum-utils
#sudo yum-config-manager \
    #--add-repo \
    #https://download.docker.com/linux/rhel/docker-ce.repo

#replace with centos repo
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#installation    
sudo yum install docker-ce docker-ce-cli containerd.io
