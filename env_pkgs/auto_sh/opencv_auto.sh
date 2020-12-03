sudo apt-get update 
sudo apt-get -y dist-upgrade
sudo apt-get update 
sudo apt-get -y upgrade
sudo apt-get -y install screen 
sudo apt-get -y install htop
sudo apt-get purge wolfram-engine 
#sudo apt-get purge libreoffice* 
sudo apt-get clean 
sudo apt-get -y autoremove
sudo apt-get -y install build-essential cmake pkg-config 
sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev 
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev 
sudo apt-get -y install libxvidcore-dev libx264-dev 
sudo apt-get -y install libgtk2.0-dev libgtk-3-dev 
sudo apt-get -y install libatlas-base-dev gfortran
#wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.3.zip 
#wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.3.zip 
unzip -u opencv-3.4.3.zip 
unzip -u opencv_contrib-3.4.3.zip
cd ./opencv-3.4.3/ 
if [ -d 'build']; then
      	echo "build folder existed"
	cd build	
else
	mkdir build && cd build 
fi
cmake -D CMAKE_BUILD_TYPE=RELEASE \ -D CMAKE_INSTALL_PREFIX=/usr/local \ -D INSTALL_PYTHON_EXAMPLES=ON \ -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.4.3/modules \ -D BUILD_EXAMPLES=ON ..
make -j4
sudo make install 
sudo ldconfig 
sudo apt-get update
pkg-config --modversion opencv
cd ../..
