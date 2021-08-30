FROM node:10-alpine

RUN apk update && apk add bash && \
    apk add curl && apk add unzip

# setting a default value to make it work on dockerhub
ENV CONSUL_TEMPLATE_VERSION=0.15.0
ENV CONSUL_HTTP_ADDR=consul.play.local:8500

# install consul-template & consul
RUN curl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip > /tmp/consul-template.zip && \
    unzip /tmp/consul-template.zip -d /usr/bin && \
    curl https://releases.hashicorp.com/consul/1.6.2/consul_1.6.2_linux_amd64.zip > /tmp/consul.zip && \
    unzip /tmp/consul.zip -d /usr/bin

WORKDIR /app

# rule of thumb, if less frequent for changes put it up here
COPY .env /app/.env
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

COPY ./scripts/run.sh /app/scripts/run.sh
RUN ["chmod", "+x", "/app/scripts/run.sh"]

RUN yarn

COPY app.js /app/app.js
COPY config.js /app/config.js

ENTRYPOINT ["sh","/app/scripts/run.sh"]

CMD ["node", "app.js"]