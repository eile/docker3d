The files in this repository show how to build and run Docker images/containers with hardware graphics support --> OpenGL + direct rendering (DRI) and a CityEngine installation

* Download the same NVidia driver as you host OS has installed
* Copy driver to CityEngine folder, e.g., ```CityEngine/NVIDIA-Linux-x86_64-390.116.run```
* Copy CityEngine installer to CityEngine folder, e.g., ```CityEngine/CityEngine_2018_1_165009.tar.gz```
* Copy your license file to ```CityEngine/CityEngine.prvc```
* Edit CityEngine/build.sh with correct versions of the above files
* Build docker image: ```cd CityEngine; ./build.sh```
* Run docker image: ```./run.sh```
