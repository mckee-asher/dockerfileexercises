#!/bin/bash
# build mysql
docker build -t trio-task-mysql:5.7 db
# run mysql container
docker run -d \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    --name amckee457/mysql \
    --network trio-task-network \
    trio-task-mysql:5.7