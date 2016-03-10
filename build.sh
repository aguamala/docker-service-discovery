#!/usr/bin/env sh

cd build/

docker build -t aguamala/service-discovery:${BUILD_NUMBER} .

DESTINATION=aguamala/haproxy-systemd:${BUILD_NUMBER}
LATEST_DESTINATION=aguamala/service-discovery:latest

docker tag aguamala/service-discovery:${BUILD_NUMBER} ${DESTINATION}
docker push ${DESTINATION}
docker tag -f aguamala/service-discovery:${BUILD_NUMBER} ${LATEST_DESTINATION}
docker push ${LATEST_DESTINATION}
