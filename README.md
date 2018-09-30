# docker-libmich-corenet
Recipe to build and run quickly corenet from Benoit Michau. 

[![Build Status](https://travis-ci.org/ravens/docker-libmich-corenet.svg?branch=master)](https://travis-ci.org/ravens/docker-libmich-corenet)

## status

For the moment, just a basic configured environement to play with pycrate and corenet.

## prereqs

A hosting machine with a kernel with SCTP support. "Native" Docker Mac does not support this, while the rest of the docker ecosystem is in good progress :
* https://github.com/docker/libnetwork/pull/1825
* https://github.com/moby/moby/issues/9689
* https://github.com/kubernetes/kubernetes/commit/2eb14e30075bd8d93d8d859066020ad901581041 (more on this on https://wiki.lfnetworking.org/download/attachments/328197/KubernetesNetworkingInTheTelcoSpace-Csatari.pdf?version=1&modificationDate=1522083330000&api=v2, http://dl.ifip.org/db/conf/icin/icin2016/1570229487.pdf)

## build

```
docker-compose build
```

## run 

For the moment, we launch a jupyter notebook with no particular customization to import and play with pycrate and corenet code.

```
docker-compose up
```

