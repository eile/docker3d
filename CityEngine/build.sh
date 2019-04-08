#!/bin/bash

IMAGE_NAME=cityengine
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-390.116.run  # path to nvidia driver
CE_INSTALLER=CityEngine_2018_1_165009.tar.gz # path to CityEngine install

cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
cp ${CE_INSTALLER} CityEngine.tar.gz
export LOCAL_UID=`id -u` 
cat Dockerfile | envsubst > .docker
docker build -t ${IMAGE_NAME} -f .docker .
