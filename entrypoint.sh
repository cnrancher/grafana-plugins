#!/bin/sh -x

rm -rf /var/lib/grafana/plugins/grafana-piechart-panel*
rm -rf /var/lib/grafana/plugins/grafana-image-renderer*

cp -rf /var/lib/grafana-plugins/* /var/lib/grafana/plugins/

if [ ${GRAFANA_CONTAINER_USER} == 'grafana' ]; then
    chown -R 472:472 /var/lib/grafana/
fi

$@
