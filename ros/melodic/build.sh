#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros-melodic" -t ros-melodic .