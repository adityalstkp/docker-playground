#!/bin/bash

NAME=$1
ADDR=$(hostname)

cat  << EOF
{
    "acl": {
        "default_policy": "allow",
        "down_policy": "extend-cache",
        "enabled": true,
        "token_ttl": "30s",
        "tokens": {}
    },
    "addresses": {
        "dns": "0.0.0.0",
        "grpc": "0.0.0.0",
        "http": "0.0.0.0",
        "https": "0.0.0.0"
    },
    "ports": {
        "dns": 8600,
        "grpc": 8502,
        "http": 8500,
        "https": -1,
        "serf_lan": 8301,
        "serf_wan": 8302,
        "server": 8300
    },
    "data_dir": "/var/consul",
    "datacenter": "dc1",
    "disable_update_check": false,
    "enable_local_script_checks": false,
    "enable_script_checks": false,
    "log_level": "ERR",
    "node_name": "$NAME-$ADDR",
    "performance": {
        "leave_drain_time": "10s",
        "raft_multiplier": 3,
        "rpc_hold_timeout": "7s"
    },
    "primary_datacenter": "dc1",
    "raft_protocol": 3,
    "recursors": [],
    "retry_interval": "30s",
    "retry_join": [],
    "retry_max": 0,
    "server": false,
    "syslog_facility": "local0",
    "ui": false
}
EOF