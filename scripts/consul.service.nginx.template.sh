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
                "name": "nginx checks",
                "tcp": "127.0.0.1:$PORT"
            }
        ],
        "tags": []
    }
}
EOF