#!/bin/bash

(/scripts/wait-for-it.sh -t 15 consul.play.local:8500)
WAIT_STATUS=$?

if [ "$WAIT_STATUS" -ne 0 ]; then 
  echo "Failed waiting consul ready"
  exit "$WAIT_STATUS"
fi

consul agent -config-file=/var/consul/config/config.json -config-dir=/etc/consul/consul.d -join=consul.play.local -retry-join "consul.play.local" &

# Run the main container command
exec "$@"