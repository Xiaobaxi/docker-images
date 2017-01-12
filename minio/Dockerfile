FROM centos

MAINTAINER fangzhibin silencon@gmail.com

ADD minio /opt/

ADD minio-start.sh /opt/

RUN chmod a+x /opt/minio

RUN chmod a+x /opt/minio-start.sh

EXPOSE 9000

VOLUME ["/opt/export"]

CMD ["sh", "/opt/minio-start.sh"]

