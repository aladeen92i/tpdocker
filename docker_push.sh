#!/bin/bash
docker build -f ./postgres/Dockerfile -t postgres:v0.1
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push aladeen92i/full-stack-repo
docker build -f ./java-backend/simple-api/Dockerfile -t simple-api:v0.1
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push aladeen92i/full-stack-repo
