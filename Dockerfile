FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /opt/selenium

COPY ./google-chrome-stable_current_amd64.deb /opt
COPY . /opt/selenium

RUN apt-get update
RUN apt-get install -y fonts-liberation libappindicator3-1 libnspr4 libnss3 libxss1 wget xdg-utils libu2f-udev libasound2 lsb-release
RUN dpkg -i /opt/google-chrome-stable_current_amd64.deb

RUN apt-get install -y python3 && apt-get install -y python3-pip && pip3 install pyyaml && pip3 install selenium

RUN apt-get install -y firefox

EXPOSE 80
EXPOSE 443
