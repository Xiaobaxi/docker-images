FROM centos

MAINTAINER fangzhibin silencon@gmail.com

RUN yum install gcc gcc-c++ make -y && \
    yum install -y ruby && \
        gem install redis -v 3.0.0

ADD redis-3.2.5.tar.gz /opt
RUN (cd /opt/redis-3.2.5 && make && make install)
RUN mkdir /etc/redis && \
    rm -rf /opt/redis-3.2.5

ADD redis.conf /etc/redis

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-server","/etc/redis/redis.conf"]
