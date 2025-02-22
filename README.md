# dockers

Dockerfile of different ROS distributions and robots.

```sh
# Clone this repository
git clone git@github.com:YueErro/dockers.git ~/git/dockers
```

## Table of contents

- [dockers](#dockers)
  - [Table of contents](#table-of-contents)
    - [Requirements](#requirements)
    - [Docker build and run](#docker-build-and-run)
    - [Troubleshooting](#troubleshooting)
    - [Useful information](#useful-information)
      - [Compile an already compiled workspace with a different ROS distro](#compile-an-already-compiled-workspace-with-a-different-ros-distro)
      - [New terminal in the same docker container](#new-terminal-in-the-same-docker-container)
      - [Share files between docker container and host machine](#share-files-between-docker-container-and-host-machine)
    - [References](#references)

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

### Troubleshooting

Latest changes in rocker don't support privileged flag and fail to run the docker. The rocker version that is currently compatible with this package is [python3-rocker_0.2.12-100_all.deb](https://gitlab/YueErro/my_dockers/python3-rocker_0.2.12-100_all.deb). I recommend to hold this debian after installing it if you are experiencing this issue:

```bash
sudo dpkg -i python3-rocker_0.2.12-100_all.deb
sudo apt-mark hold python3-rocker
```

### Useful information

#### Compile an already compiled workspace with a different ROS distro

It can be done generating a new *catkin profile* using `catkin_tools` (`sudo apt-get install python-catkin-tools`):

```bash
catkin config --profile <profile_name> -x _<profile_name>
catkin build --profile <profile_name>
```

*`_<profile_name>` can be different from `<profile_name>` but it is recommended to be something similar to the `<profile_name>`.*

#### New terminal in the same docker container

It can be opened as many as wanted terminal in the same docker container by just executing the following command in an already running docker container:

```sh
terminator -u &
```

#### Share files between docker container and host machine

These docker containers automatically share the users home directory. It has been added a shared directory in order to have organized the workspaces used in dockers: `~/git/dockers/shared`

```sh
.
|__ros
|   |__indigo
|   |__kinetic
|   |__melodic
|   |__noetic
|__ros2
|   |__humble
|   |__jazzy
|__tiago
|   |__noetic
|__tiago_dual
    |__melodic
    |__noetic
```

Keep in mind that anything there will be available in the docker and in your local machine.

### References

- [docker docs](https://docs.docker.com/engine/install/ubuntu/)
- [osrf/rocker](https://github.com/osrf/rocker)
