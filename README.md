# realSensel515

## Setup Jazzy

```bash
docker build -t realsense-jazzy .
```
```bash
xhost +local:docker
```
```bash
docker run -it --rm \
    --network host \
    --privileged \
    --device=/dev/bus/usb \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    realsense-jazzy
```
```bash
source /opt/ros/jazzy/setup.bash
source ~/ws/install/setup.bash
```
```bash
ros2 launch realsense2_camera rs_launch.py
```
## Setup humble

```bash
docker build -t realsense-humble .
```
```bash
xhost +local:docker
```
```bash
docker run -it --rm \
    --network host \
    --privileged \
    --device=/dev/bus/usb \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    realsense-humble
```
```bash
source /opt/ros/humble/setup.bash
source ~/ws/install/setup.bash
```
