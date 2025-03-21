FROM ubuntu:latest

ARG HOST_IP
ENV DISPLAY=:0

RUN apt update && apt install -y mono-devel unzip

COPY armsim_linux.zip /tmp/armsim.deb
RUN unzip /tmp/armsim.deb -d /tmp

CMD ["mono", "/tmp/armsim/ARMSim.exe"]
