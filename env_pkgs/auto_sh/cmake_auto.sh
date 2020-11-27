#cmake3.4.3 auto install
#wget http://www.cmake.org/files/v3.4/cmake-3.4.3.tar.gz
ls
if [ -d "./cmake-3.4.3" ]; then
	echo 'cmake-3.4.3 existed.'
else
	tar -xvzf cmake-3.4.3.tar.gz
fi
cd cmake-3.4.3/
./configure
make
sudo make install
sudo update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force
cmake --version
cd ..
