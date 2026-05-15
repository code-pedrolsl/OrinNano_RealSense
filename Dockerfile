FROM ros:jazzy

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    vim \
    usbutils \
    python3-colcon-common-extensions \
    python3-rosdep \
    ros-jazzy-rviz2 \
    ros-jazzy-rqt-image-view \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep update

RUN mkdir -p /root/ws/src

WORKDIR /root/ws/src

RUN git clone https://github.com/IntelRealSense/realsense-ros.git

WORKDIR /root/ws

RUN source /opt/ros/jazzy/setup.bash && \
    rosdep install --from-paths src --ignore-src -r -y

RUN source /opt/ros/jazzy/setup.bash && \
    colcon build --symlink-install

# Source automático
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
RUN echo "source /root/ws/install/setup.bash" >> ~/.bashrc

CMD ["bash"]
