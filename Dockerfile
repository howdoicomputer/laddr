FROM ubuntu:14.04

ADD . /opt
RUN apt-get install wget -y
RUN wget http://emr.ge/dist/ubuntu/quickinstall-14.04.sh -O - | sudo sh
