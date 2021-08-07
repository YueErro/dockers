#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros-noetic" -t ros-noetic .