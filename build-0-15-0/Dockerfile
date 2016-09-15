FROM aguamala/haproxy-systemd
MAINTAINER "gabo" <aguamala@deobieta.com>
ENV CONSUL_TEMPLATE_VERSION 0.15.0

RUN yum install -y unzip && \
    yum clean all

RUN gpg --keyserver keys.gnupg.net --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C && \
    mkdir -p /tmp/build && \
    cd /tmp/build && \
    curl -O https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip  && \
    curl -O https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_SHA256SUMS && \
    curl -O https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_SHA256SUMS.sig && \
    gpg --batch --verify consul-template_${CONSUL_TEMPLATE_VERSION}_SHA256SUMS.sig consul-template_${CONSUL_TEMPLATE_VERSION}_SHA256SUMS && \
    grep ${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip consul-template_${CONSUL_TEMPLATE_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    cp  consul-template /usr/local/bin/ && \
    cd /tmp && \
    rm -rf /tmp/build && \
    rm -rf /root/.gnupg && \
    yum remove -y unzip && \
    mkdir -p /etc/consul-template /etc/consul-template/conf.d /etc/consul-template/templates && \
    mkdir -p /etc/haproxy/assemble

COPY config.hcl /etc/consul-template/conf.d/
COPY consul-template.service /etc/systemd/system/
RUN systemctl enable consul-template.service

COPY service-discovery-restart-haproxy /usr/bin/
RUN chmod +x /usr/bin/service-discovery-restart-haproxy
