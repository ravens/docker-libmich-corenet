FROM ubuntu:14.04
MAINTAINER Yan Grunenberger <yan@grunenberger.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade 
RUN apt-get -yq install build-essential git
RUN apt-get -yq install python-dev python-pip && pip install pycrypto
RUN mkdir -p /usr/local/lib/python2.7/dist-packages/ && cd /usr/local/lib/python2.7/dist-packages/ && git clone https://github.com/mitshell/CryptoMobile.git && cd CryptoMobile 
RUN cd /usr/local/lib/python2.7/dist-packages/CryptoMobile && gcc -c -O2 -fPIC Kasumi.c -o Kasumi.o && gcc -shared -o Kasumi.so Kasumi.o
RUN cd /usr/local/lib/python2.7/dist-packages/CryptoMobile && gcc -c -O2 -fPIC SNOW_3G.c -o SNOW_3G.o && gcc -shared -o SNOW_3G.so SNOW_3G.o
RUN cd /usr/local/lib/python2.7/dist-packages/CryptoMobile && gcc -c -O2 -fPIC ZUC.c -o ZUC.o && gcc -shared -o ZUC.so ZUC.o
RUN python -c "from CryptoMobile.test import * ; testall()"
RUN apt-get -yq install libsctp-dev && pip install pysctp
RUN cd /root && git clone https://github.com/mitshell/libmich && cd libmich && python setup.py install 
RUN pip install ipython 
RUN cd /root && git clone https://github.com/mitshell/corenet
ENTRYPOINT /bin/bash