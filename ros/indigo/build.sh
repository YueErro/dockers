#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros-indigo" -t ros-indigo .
