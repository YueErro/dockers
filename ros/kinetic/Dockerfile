FROM osrf/ros:kinetic-desktop-full

LABEL maintainer="Yue Erro <yue.trbj@gmail.com>"

ARG IMAGE_NAME
ENV IMG_NAME=$IMAGE_NAME

ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install -y --allow-unauthenticated --no-install-recommends \
    apt-utils \
    aptitude \
    bash-completion \
    build-essential \
    ccache \
    clang \
    clang-format \
    curl \
    docker \
    dpkg \
    g++ \
    gcc \
    gdb \
    git \
    gnupg \
    htop \
    iputils-ping \
    ipython \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    locales \
    man \
    meld \
    mesa-utils \
    nano \
    openvpn \
    psmisc \
    python3-vcstool \
    python-catkin-tools \
    python-networkx \
    python-pip  \
    python-rosdep \
    python-rosinstall \
    python-scipy \
    python-wstool \
    qtcreator \
    ros-$ROS_DISTRO-joy \
    ros-$ROS_DISTRO-openslam-gmapping \
    ros-$ROS_DISTRO-rosbash \
    ros-$ROS_DISTRO-yocs-cmd-vel-mux \
    silversearcher-ag \
    ssh \
    terminator \
    tig \
    tmux \
    valgrind \
    vim \
    vim-gnome \
    wget \
  && rm -rf /var/lib/apt/lists/*

RUN bash -c "source /opt/ros/kinetic/setup.bash >> ~/.bashrc"
ENTRYPOINT ["bash"]
