FROM osrf/ros:melodic-desktop-full

LABEL maintainer="Yue Erro <yue.trbj@gmail.com>"

ARG IMAGE_NAME
ENV IMG_NAME=$IMAGE_NAME

ENV ROS_DISTRO melodic
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    locales \
    dpkg \
    python-rosdep \
    git \
    ssh \
    curl \
    wget \
    apt-utils \
    aptitude \
    g++ \
    gcc \
    openvpn \
    gnupg \
    bash-completion \
    vim \
    vim-gnome \
    nano \
    tmux \
    psmisc \
    aptitude \
    build-essential \
    ccache \
    clang \
    clang-format \
    gdb \
    qtcreator \
    htop \
    man \
    meld \
    silversearcher-ag \
    terminator \
    tig \
    valgrind \
    docker \
    iputils-ping \
    ipython \
    python-scipy \
    python3-vcstool \
    python-wstool \
    python-networkx \
    python-pip  \
    python-rosinstall \
    python-catkin-tools \
    ros-$ROS_DISTRO-rosbash \
    ros-$ROS_DISTRO-openslam-gmapping \
    ros-$ROS_DISTRO-joy \
    ros-$ROS_DISTRO-yocs-cmd-vel-mux \
  && rm -rf /var/lib/apt/lists/*

RUN bash -c "source /opt/ros/melodic/setup.bash >> ~/.bashrc"
ENTRYPOINT ["bash"]
