FROM nginx

# install unzip & dns utils
RUN apt-get update && apt-get install -y unzip && \
    apt-get install -y dnsutils

# setting a default value to make it work on dockerhub
ENV CONSUL_TEMPLATE_VERSION=0.15.0
ENV CONSUL_HTTP_ADDR=consul.play.local:8500

# install consul-template & consul
RUN curl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip > /tmp/consul-template.zip && \
    unzip /tmp/consul-template.zip -d /usr/bin && \
    curl https://releases.hashicorp.com/consul/1.6.2/consul_1.6.2_linux_amd64.zip > /tmp/consul.zip && \
    unzip /tmp/consul.zip -d /usr/bin

COPY ./scripts/ /scripts/

RUN ["chmod", "+x", "-R", "/scripts/"]

ENTRYPOINT ["/scripts/run.sh"]

CMD ["nginx", "-g", "daemon off;"]