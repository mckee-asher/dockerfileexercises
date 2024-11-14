#!/bin/bash
# build flask
docker build -t trio-task-flask-app:latest flask-app
# run flask container
docker run -d \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    --name amckee457/flask-app \
    --network trio-task-network \
    trio-task-flask-app:latest