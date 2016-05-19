# This image is intended to provide a build environment
# to enable building of the various libreelec image types.
#
#

FROM ubuntu:14.04
MAINTAINER docker@libreelec.tv

ARG DEBIAN_FRONTEND="noninteractive"

ENV PS1="$(whoami)@$(hostname):$(pwd)$ " \

HOME="/src" \

TERM="xterm"

# install our packages
RUN \
	apt-get update && \
	apt-get install -y && \
	bc \
	bzip2 \
	ccache \
	curl \
	default-jre \
	g++ \
	gawk \
	gcc \
	git \
	gperf \
	libncurses5-dev \
	libxml-parser-perl \
	make \
	texinfo \
	tar \
	u-boot-tools \
	unzip \
	wget \
	xfonts-utils \
	xsltproc \
	xz-utils \
	zip && \


# clean up
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# make our user
RUN \
	useradd -u 1000 -U -d /src -s /bin/false libreelec && \
	usermod -G users libreelec


# make and own our src folder
RUN \
	mkdir -p /src && \
	chown -R libreelec:users /src


USER libreelec
VOLUME ["/src"]



