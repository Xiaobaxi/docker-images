FROM cloud/rabbitclusterbase
MAINTAINER fangzhibin silencon@gmail.com

# Create directories
RUN mkdir /opt/rabbit

# Add the files from the local repository into the container
ADD rabbitmq.config     /etc/rabbitmq/
ADD rabbitmq-env.conf   /etc/rabbitmq/
ADD erlang.cookie       /var/lib/rabbitmq/.erlang.cookie
ADD startrabbit.sh /opt/rabbit/

# Set the file permissions in the container
RUN chmod 644 /etc/rabbitmq/rabbitmq.config
RUN chmod 644 /etc/rabbitmq/rabbitmq-env.conf
RUN chmod 400 /var/lib/rabbitmq/.erlang.cookie
RUN chmod 777 /opt/rabbit/startrabbit.sh

# Set ownership permissions on files in the container
RUN chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie

# Expose ports inside the container to the host
EXPOSE 1883
EXPOSE 8883
EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

# Run this to autostart the cluster nodes
CMD /opt/rabbit/startrabbit.sh

