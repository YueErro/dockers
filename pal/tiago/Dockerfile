FROM osrf/ros:melodic-desktop-full

LABEL maintainer="Yue Erro <yue.erro@pal-robotics.com>"

RUN mkdir -p /root/tiago_public_ws/src
WORKDIR /root/tiago_public_ws

RUN apt-get update && apt-get install -y \
    libv4l-dev \
    libv4l2rds0 \
    git \
    wget \
    python3-vcstool \
    python-rosinstall \
    ros-melodic-desktop-full \
    python-catkin-tools \
    ros-melodic-urdf-test \
    ros-melodic-urdf-geometry-parser \
    ros-melodic-joint-state-controller \
    ros-melodic-teb-local-planner \
    ros-melodic-base-local-planner \
    ros-melodic-people-msgs \
    ros-melodic-twist-mux \
    ros-melodic-uvc-camera \
    ros-melodic-ompl \
    ros-melodic-slam-toolbox \
    ros-melodic-controller-manager \
    ros-melodic-four-wheel-steering-msgs \
    ros-melodic-moveit-core \
    ros-melodic-moveit-ros-perception \
    ros-melodic-moveit-ros-move-group \
    ros-melodic-moveit-kinematics \
    ros-melodic-moveit-ros-planning-interface \
    ros-melodic-moveit-simple-controller-manager \
    ros-melodic-moveit-planners-ompl \
    ros-melodic-joy \
    ros-melodic-joy-teleop \
    ros-melodic-teleop-tools \
    ros-melodic-control-toolbox \
    ros-melodic-sound-play \
    ros-melodic-navigation \
    ros-melodic-depthimage-to-laserscan ros-melodic-moveit-commander \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://raw.githubusercontent.com/pal-robotics/tiago_tutorials/kinetic-devel/tiago_public-melodic.rosinstall \
  && vcs import src < tiago_public-melodic.rosinstall \
  && bash -c "source /opt/ros/melodic/setup.bash \
    && catkin build -DCATKIN_ENABLE_TESTING=0 \
    && echo 'source /root/tiago_public_ws/devel/setup.bash' >> ~/.bashrc"

ENTRYPOINT ["bash"]