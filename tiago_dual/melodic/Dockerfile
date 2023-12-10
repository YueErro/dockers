FROM osrf/ros:melodic-desktop-full

LABEL maintainer="Yue Erro <yue.erro@pal-robotics.com>"

ARG REPO_WS=/tiago_dual_public_ws
RUN mkdir -p $REPO_WS/src
WORKDIR $REPO_WS

ARG IMAGE_NAME
ENV IMG_NAME=$IMAGE_NAME

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    aptitude \
    bash-completion \
    ccache \
    curl \
    dpkg \
    g++ \
    gcc \
    gdb \
    git \
    gnupg \
    htop \
    iputils-ping \
    ipython \
    libv4l2rds0 \
    libv4l-dev \
    locales \
    man \
    meld \
    nano \
    openvpn \
    psmisc \
    python3-vcstool \
    python-catkin-tools \
    python-networkx \
    python-pip  \
    python-rosinstall \
    python-scipy \
    python-wstool \
    qtcreator \
    silversearcher-ag \
    ssh \
    terminator \
    tig \
    valgrind \
    vim \
    vim-gnome \
    wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://raw.githubusercontent.com/pal-robotics/tiago_dual_tutorials/master/tiago_dual_public-melodic.rosinstall \
  && vcs import src < tiago_dual_public-melodic.rosinstall

ARG ROSDEP_IGNORE="opencv2 opencv2-nonfree pal_laser_filters speed_limit_node sensor_to_cloud hokuyo_node libdw-dev python-graphitesend-pip python-statsd pal_filters pal_vo_server pal_usb_utils pal_pcl pal_pcl_points_throttle_and_filter pal_karto pal_local_joint_control camera_calibration_files pal_startup_msgs pal-orbbec-openni2 dummy_actuators_manager pal_local_planner gravity_compensation_controller current_limit_controller dynamic_footprint dynamixel_cpp tf_lookup opencv3 joint_impedance_trajectory_controller pal_moveit_capabilities omni_drive_controller pal_map_manager pal_loc_measure pal_motion_loader ydlidar_ros_driver"

RUN apt-get update && rosdep install --from-paths src --ignore-src -y --rosdistro melodic --skip-keys="${ROSDEP_IGNORE}"

RUN bash -c "source /opt/ros/melodic/setup.bash \
    && catkin build -DCATKIN_ENABLE_TESTING=0 \
    && echo 'source $REPO_WS/devel/setup.bash' >> ~/.bashrc"

ENTRYPOINT ["bash"]
