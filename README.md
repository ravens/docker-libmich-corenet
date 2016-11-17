# docker-libmich-corenet
Recipe to build and run quickly corenet from Benoit Michau. 

## prereqs

A hosting machine with a kernel with SCTP support. "Native" Docker Mac does not support this. 

## build

> docker build -t corenet .

## run 

> docker run -it corenet 

## config

edit /root/corenet/corenet.py to fix the binding address for the MME and GGSN (by default 10.1.1.1). 
The authentication database is located at :
> /usr/local/lib/python2.7/dist-packages/libmich/mobnet/AuC.db