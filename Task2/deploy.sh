#!/bin/bash
docker rm -f $(docker ps -qa) || sleep 1
docker network create trio-task-network || sleep 1
docker volume create new-volume || sleep 1

docker run -d \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    --name mysql \
    --network trio-task-network \
    ${DOCKERHUB_CREDENTIALS_USR}trio-task-mysql:5.7

docker run -d \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    --name flask-app \
    --network trio-task-network \
    ${DOCKERHUB_CREDENTIALS_USR}trio-task-flask-app:latest

docker run -d \
    --name nginx \
    -p 80:80 \
    --network trio-task-network \
    --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    nginx:latest

sleep 5
docker ps -a
