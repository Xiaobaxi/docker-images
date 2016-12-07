FROM centos
MAINTAINER fangzhibin silencon@gmail.com

# Install base deps
RUN yum install -y net-tools pwgen wget curl tar unzip mlocate logrotate

# Install base the EPEL repo
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm

# Install RabbitMQ deps
RUN rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc

RUN yum install -y erlang

RUN yum install -y  http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.5/rabbitmq-server-3.6.5-1.noarch.rpm

# enable plugins
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_mqtt rabbitmq_stomp rabbitmq_management  rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management sockjs

#CMD /usr/sbin/rabbitmq-server

# Allow triggerable events on the first time running
RUN touch /tmp/firsttimerunning
