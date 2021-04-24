# dockers
Dokerfile of different ROS distributions and robots.

```sh
# Clone this repository
git clone git@github.com:YueErro/dockers.git ~/git/dockers
```

## Table of contents
* [Requirements](#requirements)
* [Docker build and run](#docker-build-and-run)
* [Useful information](#useful-information)
  - [Compile an already compiled workspace with a different ROS distro](#compile-an-already-compiled-workspace-with-a-different-ros-distro)
  - [New terminal in the same docker container](#new-terminal-in-the-same-docker-container)
* [References](#references)

### Requirements
The following debian installation is required to run the dockers:
```sh
sudo apt-get install python3-rocker
```

### Docker build and run
```sh
cd ~/git/dockers/<"ros/ROSdistro"or"robot/ROSDistro">
# build
bash build.sh
# run according to your graphics card (Nvidia or integrated Intel)
bash run.sh <nvidia/intel>
```

### Useful information

#### Compile an already compiled workspace with a different ROS distro
It can be done generating a new *catking profile* using `catkin_tools` (`sudo apt-get install python-catkin-tools`):
```
catkin config --profile <profile_name> -x _<profile_name>
catkin build --profile <profile_name>
```
*`_<profile_name>` can be different from `<profile_name>` but it is recommended to be something similar to the `<profile_name>`.*

#### New terminal in the same docker container
It can be opened as many as wanted terminal in the same docker container by just executing the following command in an already running docker container:
```sh
terminator -u &
```

### References
* [docker docs](https://docs.docker.com/engine/install/ubuntu/)
* [osrf/rocker](https://github.com/osrf/rocker)