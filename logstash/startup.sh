docker run \
--name=logstash \
-dit \
-p 5044:5044 \
-p 9600:9600 \
-v /home/tcnsh/roger/logstash/pipeline/:/usr/share/logstash/pipeline/ \
-v /home/tcnsh/roger/logstash/logstash.yml:/usr/share/logstash/config/logstash.yml  \
docker.elastic.co/logstash/logstash:8.4.3