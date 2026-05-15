# realSense OrinNano

## Setup humble

```bash
docker build -t realsense-humble .
```
```bash
xhost +local:docker
```
```bash
docker run -it --rm \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev:/dev \
  realsense-humble
```
```bash
source /opt/ros/humble/setup.bash
source ~/ws/install/setup.bash
```
Rodando rs-hello-realsense

<img width="483" height="49" alt="image" src="https://github.com/user-attachments/assets/bb4779d2-1c3b-4401-acc8-106317c8ea68" />
