FROM docker.elastic.co/logstash/logstash:8.6.2

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN rm -rf /usr/share/logstash/config/logstash.yml
COPY config.conf /usr/share/logstash/pipeline/
COPY logstash.yml /usr/share/logstash/config/
