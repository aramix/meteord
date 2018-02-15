#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "aramix/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "aramix/meteord:node-${NODE_VERSION}-base" aramix/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "aramix/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "aramix/meteord:node-${NODE_VERSION}-onbuild" aramix/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "aramix/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "aramix/meteord:node-${NODE_VERSION}-devbuild" aramix/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "aramix/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "aramix/meteord:node-${NODE_VERSION}-binbuild" aramix/meteord:binbuild
