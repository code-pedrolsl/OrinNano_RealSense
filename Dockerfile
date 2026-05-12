FROM nvcr.io/nvidia/l4t-base:r36.2.0

ENV DEBIAN_FRONTEND=noninteractive

# Dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    ca-certificates \
    software-properties-common

# ROS2 Humble
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=arm64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" \
    > /etc/apt/sources.list.d/ros2.list

# Instala ROS2 + tools
RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    python3-colcon-common-extensions \
    python3-rosdep \
    git \
    cmake \
    build-essential \
    libssl-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    pkg-config \
    v4l-utils \
    usbutils

# Source ROS automaticamente
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

# Librealsense
WORKDIR /opt

RUN git clone https://github.com/IntelRealSense/librealsense.git

WORKDIR /opt/librealsense

RUN git checkout v2.54.2

RUN mkdir build && cd build && \
    cmake .. \
    -DFORCE_RSUSB_BACKEND=ON \
    -DBUILD_EXAMPLES=false \
    -DBUILD_GRAPHICAL_EXAMPLES=false \
    -DBUILD_WITH_OPENMP=false \
    -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    make install

RUN cp /opt/librealsense/config/99-realsense-libusb.rules \
    /etc/udev/rules.d/

CMD ["/bin/bash"]
