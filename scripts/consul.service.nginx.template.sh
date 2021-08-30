#!/bin/bash

NAME=$1
PORT=$2
ADDR=$(hostname)

cat  << EOF
{
    "service": {
        "name": "$NAME",
        "port": $PORT,
        "address": "$ADDR",
        "checks": [
            {
                "interval": "5s",
                "name": "nodejs checks",
                "tcp": "127.0.0.1:80"
            }
        ],
        "tags": []
    }
}
EOF