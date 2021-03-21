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
  - [Share files between docker container and host machine](#share-files-between-docker-container-and-host-machine)
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

#### Share files between docker container and host machine
These docker containers automatically share the users home directory. It has been added a shared directory in order to have organized the workspaces used in dockers: `~/git/dockers/shared`
```sh
.
|__ros
|   |__kinetic
|   |__melodic
|__tiago
|   |__kinetic
|   |__melodic
|__tiago_dual
    |__kinetic
    |__melodic
```
Keep in mind that anything there will be available in the docker and in your local machine.

#### New terminal in the same docker container
It can be opened as many as wanted terminal in the same docker container by just executing the following command in an already running docker container:
```sh
terminator -u &
```

### References
* [docker docs](https://docs.docker.com/engine/install/ubuntu/)
* [osrf/rocker](https://github.com/osrf/rocker)