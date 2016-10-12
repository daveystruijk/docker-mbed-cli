FROM ubuntu:latest

MAINTAINER MacRat <m@crat.jp>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python2.7 python-pip software-properties-common git mercurial
RUN add-apt-repository ppa:team-gcc-arm-embedded/ppa
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc-arm-none-eabi

RUN pip install mbed-cli PrettyTable

RUN mbed toolchain -G GCC_ARM

RUN mkdir /src

WORKDIR /src
ENTRYPOINT ["/usr/local/bin/mbed"]
