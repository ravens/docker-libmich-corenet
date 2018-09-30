FROM ubuntu:18.04
MAINTAINER Yan Grunenberger <yan@grunenberger.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade 
RUN apt-get -yq install build-essential git python3-dev libsctp-dev python3-pip
WORKDIR /root
RUN pip3 install pycrypto
RUN git clone https://github.com/mitshell/CryptoMobile.git
WORKDIR /root/CryptoMobile
RUN python3 setup.py install
RUN python3 setup.py test
WORKDIR /root
RUN git clone https://github.com/P1sec/pysctp
WORKDIR /root/pysctp
RUN python3 setup.py install
WORKDIR /root
RUN git clone https://github.com/P1sec/pycrate 
WORKDIR /root/pycrate 
RUN python3 setup.py install
WORKDIR /root
RUN git clone https://github.com/mitshell/corenet.git
WORKDIR /root/corenet
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
RUN pip3 install jupyter_nbextensions_configurator
RUN jupyter nbextensions_configurator enable 
EXPOSE 8888
ENTRYPOINT ["jupyter","notebook","--ip=0.0.0.0","--port=8888","--allow-root"]
