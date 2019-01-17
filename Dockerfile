FROM debian:stretch

USER root
RUN apt-get update
RUN apt-get install git
RUN useradd --create-home --shell /bin/bash openplc

USER openplc
WORKDIR /home/openplc
RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git
WORKDIR /home/openplc/OpenPLC_v3
RUN ./install.sh linux

RUN apt-get clean
EXPOSE 8080
