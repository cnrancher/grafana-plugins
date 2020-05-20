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
	&& 	rm -fr /var/cache/apk/*

RUN 	mkdir -p /var/lib/grafana-plugins \
	&&  wget -q -O /tmp/grafana-piechart-panel.zip https://grafana.com/api/plugins/grafana-piechart-panel/versions/${GRAFANA_PIECHART_PANEL_VERSION}/download \
	&&  unzip -d /var/lib/grafana-plugins /tmp/grafana-piechart-panel.zip
RUN wget -q -O /tmp/grafana-image-renderer.zip https://github.com/grafana/grafana-image-renderer/releases/download/${GRAFANA_IMAGE_RENDERER}/plugin-linux-x64-glibc-no-chromium.zip \
	&&  unzip -d /var/lib/grafana-plugins /tmp/grafana-image-renderer.zip \
	&&  rm -fr /tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN	chmod +x /entrypoint.sh

WORKDIR /var/lib/grafana

ENTRYPOINT ["/entrypoint.sh"]

# CMD ["/bin/bash"]