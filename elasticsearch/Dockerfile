FROM java:8u111-jdk

MAINTAINER fangzhibin  silencon@gmail.com

RUN groupadd -r es \
    && useradd -r -g es es \
    && mkdir -p /home/es/elasticsearch

COPY elasticsearch-2.4.0 /home/es/elasticsearch

RUN chown -R es:es /home/es \
    && chmod -R 777 /home/es/elasticsearch


WORKDIR /home/es/elasticsearch/bin

USER es

EXPOSE 9200 9300

CMD ["./elasticsearch"]
