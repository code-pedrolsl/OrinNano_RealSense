# realSensel515

## Setup Jetson Orin Nano

```bash
docker build -t realsense-jazzy .
```
```bash
xhost +local:docker
```
```bash
apt-get update && apt-get install -y \
    libgtk-3-dev \
    libglfw3-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev
```
```bash
cd /opt/librealsense
rm -rf build
mkdir build
cd build
```
```bash
cmake .. \
    -DFORCE_RSUSB_BACKEND=ON \
    -DBUILD_EXAMPLES=true \
    -DBUILD_GRAPHICAL_EXAMPLES=true \
    -DCMAKE_BUILD_TYPE=Release
```
```bash
make -j$(nproc)
make install
```
