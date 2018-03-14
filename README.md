# Grafana Plugins

Embedded plugins of Grafana by Alpine in a docker container.

[![](https://img.shields.io/badge/Github-thxcode/grafana--plugins-orange.svg)](https://github.com/thxcode/grafana-plugins)&nbsp;[![](https://img.shields.io/badge/Docker_Hub-maiwj/grafana--plugins-orange.svg)](https://hub.docker.com/r/maiwj/grafana-plugins)&nbsp;[![](https://img.shields.io/docker/build/maiwj/grafana-plugins.svg)](https://hub.docker.com/r/maiwj/grafana-plugins)&nbsp;[![](https://img.shields.io/docker/pulls/maiwj/grafana-plugins.svg)](https://store.docker.com/community/images/maiwj/grafana-plugins)&nbsp;[![](https://img.shields.io/github/license/thxcode/grafana-plugins.svg)](https://github.com/thxcode/grafana-plugins)

[![](https://images.microbadger.com/badges/image/maiwj/grafana-plugins.svg)](https://microbadger.com/images/maiwj/grafana-plugins)&nbsp;[![](https://images.microbadger.com/badges/version/maiwj/grafana-plugins.svg)](http://microbadger.com/images/maiwj/grafana-plugins)&nbsp;[![](https://images.microbadger.com/badges/commit/maiwj/grafana-plugins.svg)](http://microbadger.com/images/maiwj/grafana-plugins.svg)

## References

- Working on Grafana 4.6+
- [Installing Granafa Plugins Manually](http://docs.grafana.org/plugins/installation/#installing-plugins-manually)

### Embedded plugins list

- [grafana-piechart-panel 1.2.0](https://grafana.com/plugins/grafana-piechart-panel?version=1.2.0)

## How to use this image

### Start an instance

To start a container, use the following:

``` bash
$ docker run -it --rm maiwj/grafana-plugins ls /var/lib/grafana/plugins
```

## License

- grafana is released under the [Apache 2.0 License](https://github.com/grafana/grafana/blob/master/LICENSE.md)
- This image is released under the [MIT License](LICENSE)
