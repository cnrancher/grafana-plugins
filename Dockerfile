FROM alpine

MAINTAINER Frank Mai <frank@rancher.com>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
ARG GRAFANA_PIECHART_PANEL_VERSION=1.5.0
ARG GRAFANA_IMAGE_RENDERER=v2.0.0

LABEL \
	io.github.thxcode.build-date=$BUILD_DATE \
	io.github.thxcode.name="grafana-plugins" \
	io.github.thxcode.description="Embedded plugins of Grafana by Alpine in a docker container." \
	io.github.thxcode.url="https://github.com/thxcode/grafana-plugins" \
	io.github.thxcode.vcs-type="Git" \
	io.github.thxcode.vcs-ref=$VCS_REF \
	io.github.thxcode.vcs-url="https://github.com/thxcode/grafana-plugins.git" \
	io.github.thxcode.vendor="Rancher Labs, Inc" \
	io.github.thxcode.version=$VERSION \
	io.github.thxcode.schema-version="1.0" \
	io.github.thxcode.license="MIT" \
	io.github.thxcode.docker.dockerfile="/Dockerfile"

RUN apk add --update --no-cache \
		dumb-init \
		bash \
		sudo \
		openssl \
	&& 	rm -fr /var/cache/apk/* /tmp/*

RUN 	mkdir -p /var/lib/grafana-plugins/ /var/lib/grafana/plugins/ \
	&&	cd /tmp \
	&&  wget -q -O grafana-piechart-panel.zip https://grafana.com/api/plugins/grafana-piechart-panel/versions/${GRAFANA_PIECHART_PANEL_VERSION}/download \
	&&  unzip grafana-piechart-panel.zip \
	&&	rm -rf grafana-piechart-panel.zip \
	&&	mv `ls`/ /var/lib/grafana-plugins/grafana-piechart-panel/ \
	&&	wget -q -O grafana-image-renderer.zip https://github.com/grafana/grafana-image-renderer/releases/download/${GRAFANA_IMAGE_RENDERER}/plugin-linux-x64-glibc-no-chromium.zip \
	&&  unzip grafana-image-renderer.zip \
	&&	rm -rf grafana-image-renderer.zip \
	&&	mv `ls`/ /var/lib/grafana-plugins/grafana-image-renderer/ \
	&&  rm -fr /tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN	chmod +x /entrypoint.sh

WORKDIR /var/lib/grafana

ENTRYPOINT ["/entrypoint.sh"]
