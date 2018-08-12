#!/usr/bin/env bash

_FRONT='FR-FRONT'
_API='FR-API'

chmod u+x dockers/docker_build.sh

# docker build & create image.
./dockers/docker_build.sh ${_FRONT}
./dockers/docker_build.sh ${_API}
