# dockers
Dokerfile of different ROS distributions

```sh
# Clone this repository
git clone git@github.com:YueErro/dockers.git ~/git/dockers
# Clone submodules
cd ~/git/dockers
git submodule update --init --recursive
```

## Table of contents
* [Docker build and run](#docker-build-and-run)
* [Useful information](#useful-information)
  - [Submodules](#submodules)
  - [Share files between docker container and host machine](#share-files-between-docker-container-and-host-machine)
  - [New terminal in the same docker container](#new-terminal-in-the-same-docker-container)

## Docker build and run
```sh
cd ros/<ROSdistribution>
# build
bash build.sh
# run
bash run.sh
```

### Useful information
#### Submodules
Quick reference ([1](http://www.vogella.com/tutorials/GitSubmodules/article.html), [2](https://chrisjean.com/git-submodules-adding-using-removing-and-updating/), [3](https://git-scm.com/book/en/v2/Git-Tools-Submodules))
```sh
# Pull all the new commits in the submodules
git pull --recurse-submodules && git submodule update --recursive --remote
```

#### Share files between docker container and host machine
These docker containers automatically share a respective folder at: `~/git/dockers/shared`.
```sh
.
|__ros
    |__kinetic
    |__melodic
```
Keep in mind that anything there will be available in the docker and in your local machine.

#### New terminal in the same docker container
It can be opened as many as wanted terminal in the same docker container by just executing the following command in an already running docker container:
```sh
terminator -u &
```
