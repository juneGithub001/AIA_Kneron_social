# Kneron KL520 dongle on RPI Quich-starts
## Step1: pre-processes
1. prepare your RPI (suggest RPI4B, img version `2020-08-20-raspios-buster-armhf`)
    > Official RPI img [download link](https://downloads.raspberrypi.org/raspios_full_armhf/images/raspios_full_armhf-2020-08-24/2020-08-20-raspios-buster-armhf-full.zip)
2. git clone this repo
3. plug in Kneron KL520 dongle

> example
```
git clone https://gitlab.aiacademy.tw/junew/AIA_Kneron.git
```

## Step2: Auto env. build 
```
cd AIA_Kneron
bash kneron_env_auto.sh
```

## Step3: dme_keras (pre-train model inference)
```
cd AIA_Kneron/host_lib__v0.8/python
python3 main.py -t dme_keras
```
> result shoud like this:
![jpg cna't show](https://imgur.com/Vi2DEU0.jpg)

## Intro of KL520 dongle on RPI
## Issue list:
- cmake -DBUILD_OPENCV_EX=on .. error
    - 原因: cmake版本太舊 (for 2020-08-20-raspios-buster-armhf-full.zip)
    - 解決方法: 安裝cmake
    ```
    key:
    cmake -DBUILD_OPENCV_EX=on .. error
    OpenCVConfig.cmake     opencv-config.cmake
    ```
- 在host_lib__v0.8內執行`cmake -DBUILD_OPENCV_EX=on ..`時出現error
    - 原因: 找不到opencv (c++) (opencv-python lib是不行的，經測試libopencv-dev的版本目前太舊，也不敷使用)
    - 解決方法: 從source安裝opencv_3.4
- 執行dme_keras專案時，出現`could not set to DME mode:0..`
    - 可能原因
        1. 找不到KL520 dongle
            - 請確認是否有正確裝置dongle
        2. dme_keras在預設路徑找不到可以執行的model
            - 請重新下載host_lib並編譯環境
        3. KL520 dongle沒有權限執行
            - 建立root環境(sudo pip install 應安裝的pkgs)，並用root身分執行推論程序
            - 設定規則讓dongle有root權限，執行auto_sh內的usb_auto.sh

## ref: 
- 調整usb權限
    - https://blog.csdn.net/qq_23670601/article/details/88756372
- 安裝cmake
    - https://www.claudiokuenzler.com/blog/611/installing-cmake-3.4.1-ubuntu-14.04-trusty-using-alternatives
- 安裝opencv
    - https://towardsdatascience.com/installing-opencv-3-4-3-on-raspberry-pi-3-model-b-e9af08a9f1d9
- 安裝與使用pyenv(可選)
    - https://learningsky.io/python-development-on-ubuntu-with-pyenv-virtualenv/

