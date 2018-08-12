#!/usr/bin/env bash

PROJ=$1
# https://stackoverflow.com/questions/2264428/how-to-convert-a-string-to-lower-case-in-bash
BUILD_PROJ=$(echo "${PROJ}" | tr '[:upper:]' '[:lower:]')

PROJ_PORT=80
PROJ_PATH=$(pwd)
DOCKERFILE_PATH=${PROJ_PATH}/${PROJ}/Dockerfile

docker build --tag ${BUILD_PROJ} \
--build-arg proj=${PROJ} \
-f ${DOCKERFILE_PATH} \
${PROJ_PATH}

docker run --name ${PROJ} \
-p ${PROJ_PORT}:80 \
-d ${BUILD_PROJ}
