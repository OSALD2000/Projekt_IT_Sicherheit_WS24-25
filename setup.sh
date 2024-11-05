#!/bin/bash

NAME="it-sicherheit"

docker rm $NAME
docker build --tag $NAME .
docker run --name it-sicherheit -it -p 8080:8080 -p 8009:8009 it-sicherheit
