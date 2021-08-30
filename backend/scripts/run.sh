#!/bin/bash

(/scripts/wait-for-it.sh -t 15 consul.play.local:8500)
WAIT_STATUS=$?

if [ "$WAIT_STATUS" -ne 0 ]; then 
  echo "Failed waiting consul ready"
  exit "$WAIT_STATUS"
fi

NAME="play-backend"
PORT=3000

# add service json consul agent
mkdir -p /etc/consul/consul.d/
/scripts/consul.service.node.template.sh $NAME $PORT > /etc/consul/consul.d/service-backend.json

# add consul-agent config
mkdir -p /var/consul/config/
/scripts/consul.agent.template.sh $NAME > /var/consul/config/config.json

consul agent -config-file=/var/consul/config/config.json -config-dir=/etc/consul/consul.d -join=consul.play.local -retry-join "consul.play.local" &

# Run the main container command
exec "$@"