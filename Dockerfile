FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python2.7 python-pip gcc-arm-none-eabi git

RUN pip install mbed-cli

RUN mbed toolchain -G GCC_ARM

RUN mkdir /src

WORKDIR /src
ENTRYPOINT ["/usr/local/bin/mbed"]
