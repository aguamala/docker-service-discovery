#!/usr/bin/env sh


CONSUL_TEMPLATE_VERSION=0.10.0

cd build-0-10-0/

docker build -t aguamala/service-discovery:${CONSUL_TEMPLATE_VERSION} .

DESTINATION=aguamala/haproxy-systemd:${CONSUL_TEMPLATE_VERSION}
LATEST_DESTINATION=aguamala/service-discovery:latest

docker tag aguamala/service-discovery:${CONSUL_TEMPLATE_VERSION} ${DESTINATION}
docker push ${DESTINATION}
docker tag -f aguamala/service-discovery:${CONSUL_TEMPLATE_VERSION} ${LATEST_DESTINATION}
docker push ${LATEST_DESTINATION}
