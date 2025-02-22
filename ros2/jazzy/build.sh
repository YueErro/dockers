#!/bin/sh

docker build --build-arg USER=$USER --build-arg IMAGE_NAME="ros2-jazzy" -t ros2-jazzy .
