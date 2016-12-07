### rabbitmq docker images

####for rabbitmq cluster test

 - base folder    : This is the base Dockerfile which builds on a CentOS image and installs the RabbitMQ binaries on the image
 - server folder  : This builds on the base image and has the startup script for bring up a RabbitMQ server
 - cluster folder : This contains a docker-compose definition file(docker-compose.yml) for brining up the rabbitmq cluster. Use docker-compose up -d to bring up the cluster
