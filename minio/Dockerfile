FROM centos

MAINTAINER fangzhibin silencon@gmail.com

ADD minio /opt/

ADD minio-start.sh /opt/

RUN chmod a+x /opt/minio

RUN chmod a+x /opt/minio-start.sh

EXPOSE 9000

ENV MINIO_ACCESS_KEY=minio \
    MINIO_SECRET_KEY=minio@123

VOLUME ["/opt/export"]

CMD ["sh", "/opt/minio-start.sh"]

