# Coherence Docker Image with Metrics

This document explains how to run the Coherence Docker image and view metrics via Grafana using `docker-compose`.

In this example we use 3 docker images:
1. Grafana
1. Prometheus
1. Coherence Community Edition (20.06.1)

# Prerequisites

You must have the following:
* Docker Desktop for Mac or the equivalent Docker environment for you O/S.
* docker-compose
* Cloned this repository - https://github.com/tmiddlet2666/coherence-docker-metrics.git

# Download the Grafana Dashboards

1. Clone the Coherence Operator repository - https://github.com/oracle/coherence-operator.git


1. Copy all the *.json files from `coherence-operator/dashboards/grafana` to `grafana/dashboards`

# Start the Docker containers

from the directory `coherence-docker-metrics` directory run:

```bash
docker-compose up -d
Creating coherence-docker-metrics_grafana_1    ... done
Creating coherence-docker-metrics_coherence_1  ... done
Creating coherence-docker-metrics_prometheus_1 ... done

docker ps
CONTAINER ID        IMAGE                                           COMMAND                  CREATED             STATUS              PORTS                                                                                           NAMES
4d6e6481f308        grafana/grafana                                 "/run.sh"                20 seconds ago      Up 19 seconds       0.0.0.0:3000->3000/tcp                                                                          coherence-docker-metrics_grafana_1
0acff01dcdac        oraclecoherence/coherence-ce:20.06.1            "java -Dcoherence.lo…"   20 seconds ago      Up 19 seconds       0.0.0.0:1408->1408/tcp, 9612/tcp, 0.0.0.0:7001->7001/tcp, 0.0.0.0:30000->30000/tcp, 20000/tcp   coherence-docker-metrics_coherence_1
dea09bd6903e        prom/prometheus                                 "/bin/prometheus --c…"   20 seconds ago      Up 19 seconds       0.0.0.0:9090->9090/tcp                                                                          coherence-docker-metrics_prometheus_1
```

# Access Grafana Dashboards

Access the Grafana dashboard using the following URL:

http://127.0.0.1:3000/d/coh-main/coherence-dashboard-main

Default username/password is admin/admin

# Access Prometheus

If required, you can access the Prometheus UI using the following URL:

http://127.0.0.1:9000/

# Troubleshooting

If you have issues with the Grafana dashboards showing data, then check the Prometheus targets using the following URL:

http://10.0.0.204:9090/targets

If you get a message similar to the following, then you may need to change the hostname in `prometheus/prometheus.yaml` to the IP/hostname you are running on.

```console
Get "http://host.docker.internal:7001/metrics": dial tcp: lookup host.docker.internal on 10.0.0.138:53: no such host
```

# References

See the following for more information:
* [Coherence Community Edition on GitHub](https://github.com/oracle/coherence)
* [Coherence Community Home Page](https://coherence.community/)
* [Coherence documentation on Metrics](https://docs.oracle.com/en/middleware/standalone/coherence/14.1.1.0/manage/using-coherence-metrics.html)
* [Coherence Operator on GitHub](https://github.com/oracle/coherence-operator)
* [Coherence Operator Metrics Documentation](https://oracle.github.io/coherence-operator/docs/3.0.0/#/metrics/010_overview)
* [Coherence Operator Grafana Dashboards in Detail](https://oracle.github.io/coherence-operator/docs/3.0.2/#/metrics/040_dashboards)
* [Grafana](https://grafana.com/)
