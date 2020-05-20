#!/bin/sh -x

cp -rf /var/lib/grafana/grafana-plugins/* /var/lib/grafana/plugins/

if [ ${GRAFANA_CONTAINER_USER} == 'grafana' ]; then
    chown -R 472:472 /var/lib/grafana/
fi

$@
