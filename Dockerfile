# This image is intended to provide a build environment
# to enable building of the various libreelec image types.
#
#

FROM ubuntu:16.04
MAINTAINER docker@libreelec.tv
ARG DEBIAN_FRONTEND="noninteractive"

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
	bc \
	bzip2 \
	ccache \
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
        unzip \
        wget \
        xfonts-utils \
	xsltproc \
	xz-utils \
        zip \


# clean up
&&	apt-get clean \
&&	rm -rf /var/lib/apt/lists/*

# make our user
RUN \
	useradd -u 1000 -U -d /src -s /bin/false libreelec \
&&	usermod -G users libreelec

WORKDIR ["/src"
VOLUME ["/output" "/src"]

# make and own our src and output folders
RUN \
	mkdir -p /output /src \
	&& chown -R libreelec:users /src /output
USER libreelec


