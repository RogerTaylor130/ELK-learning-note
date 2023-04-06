# helps

## ports

need to open port 5044 and 9600

## installation

```shell
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
[logstash-8.6.2]
name=Elastic repository for 8.6.2 packages
baseurl=https://artifacts.elastic.co/packages/8.6.2/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
sudo yum install logstash

logstash -f filename  <- this command need user in the right(~) dirctory

logstash --config.test_and_exit -f filename

logstash -e 'input { stdin { } } output { elasticsearch{hosts => ["http://192.168.111.134:9200"] index => 'test3'} stdout {} }' --debug


logstash-plugin update *******

logstash-plugin install logstash-input-beats


docker run --rm --restart always -dit --privileged -v /home/tcnsh/logstash/pipeline/:/usr/share/logstash/pipeline/ -v /home/tcnsh/logstash/config/:/usr/share/logstash/config/ -p 9600:9600 -p 5044:5044 docker.elastic.co/logstash/logstash:8.4.3
```

## document_id

**[@metadate][_id] is from filebeat**
metadata => true
