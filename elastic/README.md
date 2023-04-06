# Notes and commands for elasticsearch

## installation and host setup

**Set vm.max_map_count to at least 262144**
The vm.max_map_count kernel setting must be set to at least 262144 for production use.

**How you set vm.max_map_count depends on your platform.**
**Linux:**
To view the current value for the vm.max_map_count setting, run:
grep vm.max_map_count /etc/sysctl.conf
vm.max_map_count=262144
To apply the setting on a live system, run:
sysctl -w vm.max_map_count=262144

**Configuration files must be readable by the elasticsearch user**
By default, Elasticsearch runs inside the container as user elasticsearch using uid:gid 1000:0.

One exception is Openshift, which runs containers using an arbitrarily assigned user ID. Openshift presents persistent volumes with the gid set to 0, which works without any adjustments.

If you are bind-mounting a local directory or file, it must be readable by the elasticsearch user. In addition, this user must have write access to the config, data and log dirs (Elasticsearch needs write access to the config directory so that it can generate a keystore). A good strategy is to grant group access to gid 0 for the local directory.

For example, to prepare a local directory for storing data through a bind-mount:

mkdir esdatadir
chmod g+rwx esdatadir
chgrp 0 esdatadir

## docker compose set up

**deal with time**
Added **- /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro** to compose file, The time is correct when I type **date** command.
/etc/timezone is used in ubuntu
TZ=Asian/Shanghai with /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime:ro will have bug

**my local time**: 13:58

**elasticsearch container log time**:
{"@timestamp":"**2023-03-30T05:58:15.802Z**", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.18.0.3:9200, remoteAddress=/192.168.32.186:53409}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[es01][transport_worker][T#10]","log.logger":"org.elasticsearch.xpack.security.transport.netty4.SecurityNetty4HttpServerTransport","elasticsearch.cluster.uuid":"COE1aGrTQa67SAgpsAtf_A","elasticsearch.node.id":"Edb6G6KSSICALBRYXdnyfA","elasticsearch.node.name":"es01","elasticsearch.cluster.name":"docker-cluster"}

**elasticsearch container log time**: 13:58

**kibana log time**:
[**2023-03-30T00:58:51.988-05:00**][INFO ][plugins.fleet] Running Fleet Usage telemetry send task

**kibana local time**: 13:58

### conclusion

The `@timestamp` in elasticsearch and logstash is allways UTC time, but Kibana will convert it to the **browser time**
