touch 50-myusb.rules
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="3231", ATTRS{idProduct}=="0100", GROUP="users", MODE="0777",SYMLINK+="dhrobot_base"' >> 50-myusb.rules
sudo mv 50-myusb.rules /etc/udev/rules.d/
sudo udevadm control --reload
