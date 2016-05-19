#/bin/bash

git clone https://github.com/LibreELEC/LibreELEC.tv

cd LibreELEC.tv

git checkout "${GIT_BRANCH}"


PROJECT="${BUILD_TYPE}" ARCH="${BUILD_ARCH}" make image
