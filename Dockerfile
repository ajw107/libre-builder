# This image is intended to provide a build environment
# to enable building of the various libreelec image types.
#
#

FROM ubuntu:16.04
MAINTAINER docker@libreelec.tv

ARG DEBIAN_FRONTEND="noninteractive"

ENV PS1="$(whoami)@$(hostname):$(pwd)$ " \

HOME="/src" \

TERM="xterm"


# install apt-utils for cleaner package installs
RUN \
	apt-get update \
&& 	apt-get install -y \
	apt-utils \
&& 	rm -rf /var/lib/apt/lists/*

# install our packages
RUN \
	apt-get update \
&&	apt-get install -y \
	bc=1.06.95-9build1 \
	bzip2=1.0.6-8 \
	ccache=3.2.4-1 \
	curl=7.47.0-1ubuntu2 \
        default-jre=2:1.8-56ubuntu2 \
	g++=4:5.3.1-1ubuntu1 \
	gawk=1:4.1.3+dfsg-0.1 \
	gcc=4:5.3.1-1ubuntu1 \
	git=1:2.7.4-0ubuntu1 \
	gperf=3.0.4-2 \
	libncurses5-dev=6.0+20160213-1ubuntu1 \
	libxml-parser-perl=2.44-1build1 \
        make=4.1-6 \
        texinfo=6.1.0.dfsg.1-5 \
	tar=1.28-2.1 \
        u-boot-tools=2016.01+dfsg1-2ubuntu1 \
        unzip=6.0-20ubuntu1 \
        wget=1.17.1-1ubuntu1 \
        xfonts-utils=1:7.7+3 \
	xsltproc=1.1.28-2.1 \
	xz-utils=5.1.1alpha+20120614-2ubuntu2 \
        zip=3.0-11 \


# clean up
&&	apt-get clean \
&&	rm -rf /var/lib/apt/lists/*

# make our user
RUN \
	useradd -u 1000 -U -d /src -s /bin/false libreelec \
&&	usermod -G users libreelec


# make and own our src folder
RUN \
	mkdir -p /src \
	&& chown -R libreelec:users /src


USER libreelec
VOLUME ["/src"]

