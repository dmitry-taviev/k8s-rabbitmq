#!/bin/bash

export CORRECT_HOSTNAME="${HOSTNAME}.${CLUSTER_DNS}.${CLUSTER_NAMESPACE}.svc.cluster.local"
export RABBITMQ_NODENAME="rabbit@${CORRECT_HOSTNAME}"
export RABBITMQ_USE_LONGNAME=true

if [[ "$HOSTNAME" == *-0 ]]
then
    rabbitmq-server
else
	rabbitmq-server -detached
	rabbitmqctl stop_app
    rabbitmqctl join_cluster rabbit@${CLUSTER_WITH}.${CLUSTER_DNS}.${CLUSTER_NAMESPACE}.svc.cluster.local
    rabbitmqctl start_app
    tail -f /dev/stdout
fi