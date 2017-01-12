FROM centos

MAINTAINER fangzhibin silencon@gmail.com

ADD redis-3.2.5.tar.gz /opt
RUN (cd /opt/redis-3.2.5 && make && make install)
RUN mkdir /etc/redis && \
    mkdir /var/redis && \
    rm -rf /opt/redis-3.2.5

ADD redis.conf /etc/redis

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-server","/etc/redis/redis.conf"]
