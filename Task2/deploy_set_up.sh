#!/bin/bash
# remove running containers
docker rm -f $(docker ps -qa)
# create a network
docker network create trio-task-network
#create a volume
docker volume create new-volume
# run the nginx container
docker run -d \
    --name nginx \
    -p 80:80 \
    --network trio-task-network \
    --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    nginx:latest