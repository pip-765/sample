#!/bin/sh

export CONTAINER_TASK_ID=$(curl -s ${ECS_CONTAINER_METADATA_URI_V4}/task | jq -r '.TaskARN | split("/") | .[2]')
mkdir -p /efs/${CONTAINER_TASK_ID}
ln -s /efs/${CONTAINER_TASK_ID}/access_log /var/log/httpd/access_log

/usr/sbin/apachectl -D FOREGROUND
