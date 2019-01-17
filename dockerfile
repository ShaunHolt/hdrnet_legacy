FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

RUN apt update
RUN apt install -qqy python python-dev python-pytest cython curl gcc

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py

WORKDIR /hdrnet/hdrnet

RUN pip install numpy==1.12.0
RUN pip install -r requirements.txt

RUN make

RUN pip install scipy
RUN py.test test

# WORKDIR /hdrnet/benchmark
# RUN apt install -qqy pkg-config libglew-dev freeglut3-dev libopencv-dev libgflags-dev