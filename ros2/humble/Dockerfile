FROM osrf/ros:humble-desktop-full

LABEL maintainer="Yue Erro <yue.trbj@gmail.com>"

ARG IMAGE_NAME
ENV IMG_NAME=$IMAGE_NAME

ENV ROS_DISTRO humble
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
    feh \
    g++ \
    gcc \
    gdb \
    git \
    gnupg \
    htop \
    iputils-ping \
    ipython3 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    locales \
    man \
    meld \
    mesa-utils \
    nano \
    openvpn \
    psmisc \
    python3-colcon-clean \
    python3-colcon-common-extensions \
    python3-flake8-docstrings \
    python3-networkx \
    python3-pip  \
    python3-pytest-cov \
    python3-rosdep \
    python3-rosinstall \
    python3-scipy \
    python3-vcstool \
    python3-wstool \
    python3-yaml \
    qtcreator \
    silversearcher-ag \
    ssh \
    terminator \
    tig \
    tmux \
    valgrind \
    vim \
    wget \
  && rm -rf /var/lib/apt/lists/*

RUN bash -c "source /opt/ros/humble/setup.bash >> ~/.bashrc"
ENTRYPOINT ["bash"]
