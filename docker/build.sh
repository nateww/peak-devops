#!/bin/sh -e

docker build -t peak-flask .
docker run --rm -it -p 8080:5000 peak-flask
