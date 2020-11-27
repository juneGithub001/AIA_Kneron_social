cd env_pkgs
bash ./auto_sh/cmake_auto.sh
#bash ./env_pkgs/auto_sh/pyenv_auto.sh
bash ./auto_sh/opencv_auto.sh
bash ./auto_sh/usb_auto.sh
cd ..
unzip -o -u host_lib__v0.8.zip 
cd host_lib__v0.8
sudo apt -y autoremove
sudo apt -y install libusb-1.0-0-dev
yes | pip3 install --upgrade pip
yes | pip3 install opencv-python
yes | pip3 install pkgs/kdp_host_api-1.1.4_Raspbian_-py3-none-any.whl
if [ -d "build" ]; then
	echo "build folder existed"
	cd build
else
	mkdir build && cd build
fi
cmake ..
cmake -DBUILD_OPENCV_EX=on ..
make -j4
sudo reboot
