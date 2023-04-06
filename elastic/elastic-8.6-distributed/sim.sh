
docker run -dit -p 9200:9200 --name es-sim01 docker.elastic.co/elasticsearch/elasticsearch:8.6.2
# sleep 5

docker run -dit -p 9200:9200 --name es-sim02 docker.elastic.co/elasticsearch/elasticsearch:8.6.2
# sleep 5

docker run -dit -p 9200:9200 --name es-sim03 docker.elastic.co/elasticsearch/elasticsearch:8.6.2
# sleep 5

# es_sim01_ip=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' es-sim01`

# es_sim02_ip=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' es-sim02`

# es_sim03_ip=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' es-sim03`

sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" >> /etc/sysctl.conf

# es_sim01_ip="1"

# es_sim02_ip="2"

# es_sim03_ip="3"

echo -ne \
"instances:\n"\
"  - name: es-sim01\n"\
"    dns:\n"\
"      - es-sim01\n"\
"      - localhost\n"\
"    ip:\n"\
"      - 127.0.0.1\n"\
"      - 192.168.39.168\n"\
"      - 192.168.39.12\n"\
"      - 192.168.33.168\n"\
"  - name: es-sim02\n"\
"    dns:\n"\
"      - es-sim02\n"\
"      - localhost\n"\
"    ip:\n"\
"      - 127.0.0.1\n"\
"      - 192.168.39.168\n"\
"      - 192.168.39.12\n"\
"      - 192.168.33.168\n"\
"  - name: es-sim03\n"\
"    dns:\n"\
"      - es-sim03\n"\
"      - localhost\n"\
"    ip:\n"\
"      - 127.0.0.1\n"\
"      - 192.168.39.168\n"\
"      - 192.168.39.12\n"\
"      - 192.168.33.168\n"\
> ./instances.yml;