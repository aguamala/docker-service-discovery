FROM aguamala/haproxy-systemd
MAINTAINER "gabo" <aguamala@deobieta.com>
ENV CONSUL_TEMPLATE_VERSION 0.10.0

ADD https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz /

RUN tar zxvf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    mv consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64/consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64 && \
    mkdir -p /etc/consul-template /etc/consul-template/conf.d /etc/consul-template/templates

COPY  config.hcl /etc/consul-template/conf.d/
COPY  consul-template.service /etc/systemd/system/
RUN systemctl enable consul-template.service
