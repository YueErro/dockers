FROM osrf/ros:kinetic-desktop-full

LABEL maintainer="Yue Erro <yue.erro@pal-robotics.com>"

RUN mkdir -p /root/tiago_public_ws/src
WORKDIR /root/tiago_public_ws

ENV ROS_DISTRO kinetic

RUN apt-get update && apt-get install -y \
    libv4l-dev \
    libv4l2rds0 \
    git \
    wget \
    python3-vcstool \
    python-rosinstall \
    python-catkin-tools \
    ros-$ROS_DISTRO-desktop-full \
    ros-$ROS_DISTRO-urdf-test \
    ros-$ROS_DISTRO-urdf-geometry-parser \
    ros-$ROS_DISTRO-joint-state-controller \
    ros-$ROS_DISTRO-teb-local-planner \
    ros-$ROS_DISTRO-base-local-planner \
    ros-$ROS_DISTRO-people-msgs \
    ros-$ROS_DISTRO-humanoid-nav-msgs \
    ros-$ROS_DISTRO-twist-mux \
    ros-$ROS_DISTRO-uvc-camera \
    ros-$ROS_DISTRO-ompl \
    ros-$ROS_DISTRO-controller-manager \
    ros-$ROS_DISTRO-four-wheel-steering-msgs \
    ros-$ROS_DISTRO-moveit-core \
    ros-$ROS_DISTRO-moveit-ros-perception \
    ros-$ROS_DISTRO-moveit-ros-move-group \
    ros-$ROS_DISTRO-moveit-kinematics \
    ros-$ROS_DISTRO-moveit-ros-planning-interface \
    ros-$ROS_DISTRO-moveit-simple-controller-manager \
    ros-$ROS_DISTRO-moveit-planners-ompl \
    ros-$ROS_DISTRO-joy \
    ros-$ROS_DISTRO-joy-teleop \
    ros-$ROS_DISTRO-teleop-tools \
    ros-$ROS_DISTRO-control-toolbox \
    ros-$ROS_DISTRO-sound-play \
    ros-$ROS_DISTRO-navigation \
    ros-$ROS_DISTRO-depthimage-to-laserscan \
    ros-$ROS_DISTRO-moveit-commander \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://raw.githubusercontent.com/pal-robotics/tiago_tutorials/kinetic-devel/tiago_public.rosinstall \
  && vcs import src < tiago_public.rosinstall \
  && bash -c "source /opt/ros/kinetic/setup.bash \
    && catkin build -DCATKIN_ENABLE_TESTING=0 \
    && echo 'source /root/tiago_public_ws/devel/setup.bash' >> ~/.bashrc"

ENTRYPOINT ["bash"]
