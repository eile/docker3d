FROM centos
MAINTAINER github/eile

RUN yum update -y

# install nvidia driver
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN yum install -y binutils less file
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

# add ceuser
RUN groupadd ceuser
RUN useradd -rm -u $LOCAL_UID -g ceuser ceuser
RUN usermod -aG wheel ceuser
RUN echo docker4ce | passwd ceuser --stdin

# install CityEngine
ADD CityEngine.tar.gz /tmp/CityEngine
ADD CityEngine.prvc /tmp/CityEngine.prvc
RUN yum install -y gtk2 sudo glx-utils redhat-lsb-core fuse fuse-libs libXScrnSaver libpng12 qt-x11-4.8.7-2.el7.x86_64

#   Patch up CE installer to run during Docker build:
RUN sed -i 's/DetectedOpenGLVersion=.*$/DetectedOpenGLVersion=4.5/' /tmp/CityEngine/Setup
RUN SUDO_USER=root LOGNAME=ceuser /tmp/CityEngine/Setup -m silent -l yes
RUN rm -rf /tmp/CityEngine

#   Patch up CE license installer and run it:
RUN sed -i 's/fusemods=.*$/fusemods="yes"/' /home/ceuser/esri/cityengine2018.1/service/install_fnp.sh
RUN cd /home/ceuser/esri/cityengine2018.1/service && SUDO_USER=root ./install_fnp.sh
# -a /tmp/CityEngine.prvc

# Drop to final user privilege
USER ceuser
WORKDIR /home/ceuser
