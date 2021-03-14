FROM osrf/ros:melodic-desktop-full

LABEL maintainer="Yue Erro <yue.trbj@gmail.com>"

#Disable gnupg ipv6 for bionic issues
RUN mkdir ~/.gnupg
RUN echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf
# We get an error with hash sum mismatch if we do not remove this file
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes
# Melodic and onwards have libglvnd embedded
RUN ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
# This resolves some issues downloading gpg keyshttps://github.com/inversepath/usbarmory-debian-base_image/issues/9
RUN mkdir -p ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf

# nvidia-docker hooks
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
# nvidia-docker2
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y  --no-install-recommends \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
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
    ros-melodic-rosbash \
    ros-melodic-openslam-gmapping \
    ros-melodic-joy \
    ros-melodic-yocs-cmd-vel-mux

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --reinstall -y locales  \
    && rm -rf /var/lib/apt/lists/*
# uncomment chosen locale to enable it's generation
RUN sed -i 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen \
    ||  echo "en_GB.UTF-8 UTF-8" > /etc/locale.gen
# generate chosen locale
RUN locale-gen en_GB.UTF-8

RUN set -ex && \
    for key in \
        B42F6819007F00F88E364FD4036A9C25BF357DD4 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
        gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done
RUN curl -k -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-$(dpkg --print-architecture)" \
    && curl -k -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN echo "root:root" | chpasswd
RUN useradd --shell /bin/bash -c "" --create-home user
RUN adduser user video
RUN adduser user audio
# Give sudo access to user "user"
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY gosu_entrypoint.sh /usr/local/bin/gosu_entrypoint.sh

# https://github.com/rocker-org/rocker/issues/3://github.com/rocker-org/rocker/issues/35
# The file below disables the apt cache, we'd like to keep it for autocompletion
# on some debug images
RUN rm /etc/apt/apt.conf.d/docker-clean
RUN ulimit -n 10000
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN mkdir -p /home/user/shared/ros/melodic
WORKDIR /home/user/shared/ros/melodic

ENV ROSCONSOLE_FORMAT='[${severity}] [${time}]: ${message} [${file}:${line}]'
COPY git.sh /usr/local/bin/git.sh

RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc \
    && echo "source /usr/local/bin/gosu_entrypoint.sh" >> /root/.bashrc
    #&& echo "source /usr/local/bin/git.sh" >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
