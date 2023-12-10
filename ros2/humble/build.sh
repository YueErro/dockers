#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros2-humble" -t ros2-humble .
