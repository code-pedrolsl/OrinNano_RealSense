FROM ros:humble

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
    ros-humble-rviz2 \
    ros-humble-rqt-image-view \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep update

RUN mkdir -p /root/ws/src

WORKDIR /root/ws/src

RUN git clone -b ros2-master https://github.com/IntelRealSense/realsense-ros.git

WORKDIR /root/ws

RUN source /opt/ros/humble/setup.bash && \
    rosdep install --from-paths src --ignore-src -r -y

RUN source /opt/ros/humble/setup.bash && \
    colcon build --symlink-install

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source /root/ws/install/setup.bash" >> ~/.bashrc

CMD ["bash"]
