#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros-kinetic" -t ros-kinetic .