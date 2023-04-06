

cluster.initial_master_nodes: es-sim01,es-sim02,es-sim03: cluster.initial_master_nodes must equals to all the node.name

discovery could use ipv4,mac addr, ipv6 , ip:port

network.publish_host: vety import. Completed handshake with (host Ip) but follow up (container ip) connection failed. I guess it is because I used docker to deploy all the master nodes in different host. That's why it could found other host but can't communicate with the container ip due to the docker network.

reset passowrd for kibana_system user

remove cluster_initial_master_nodes after the first bootstrap ----- Note that you should **remove cluster.initial_master_nodes from the configuration after the cluster has started for the first time.** Do not use this setting when restarting nodes or when adding new nodes to an existing cluster. **Instead, configure discovery.seed_hosts or discovery.seed_providers.** If you do not need any discovery configuration, for instance if running a single-node cluster, set discovery.seed_hosts: [] to disable discovery and satisfy this bootstrap check.

Don't forget to sync time with host machine