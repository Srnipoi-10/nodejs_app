#!/bin/bash
set -e

IMAGE_NAME=$1
CONTAINER_NAME=$2
PORT=$3

if [[ -z "$IMAGE_NAME" || -z "$CONTAINER_NAME" || -z "$PORT" ]]; then
    echo "Usage: $0 <IMAGE_NAME> <CONTAINER_NAME> <PORT>"
    exit 1
fi

# Сборка Docker-образа
docker build -t $IMAGE_NAME .

# Проверка существующего контейнера
RUNNING_CONTAINER=$(docker ps -q --filter "name=$CONTAINER_NAME")
if [ -n "$RUNNING_CONTAINER" ]; then
    echo "Stopping and removing running container..."
    docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
else
    echo "No running container found."
fi

# Запуск нового контейнера
docker run -d --name $CONTAINER_NAME -p $PORT:$PORT $IMAGE_NAME
echo "Container $CONTAINER_NAME is running with image $IMAGE_NAME"
