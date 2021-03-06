## BUILDING
##   (from project root directory)
##   $ docker build -t bitnami-bitnami-docker-mariadb .
##
## RUNNING
##   $ docker run bitnami-bitnami-docker-mariadb

FROM gcr.io/stacksmith-images/ubuntu:14.04-r07

MAINTAINER Bitnami <containers@bitnami.com>

LABEL com.bitnami.stacksmith.id="wgp5xzg" \
      com.bitnami.stacksmith.name="bitnami/bitnami-docker-mariadb"

ENV STACKSMITH_STACK_ID="wgp5xzg" \
    STACKSMITH_STACK_NAME="bitnami/bitnami-docker-mariadb" \
    STACKSMITH_STACK_PRIVATE="1"

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

ENV BITNAMI_IMAGE_VERSION=10.1.14-r0 \
    BITNAMI_APP_NAME=mariadb \
    BITNAMI_APP_USER=mysql

RUN bitnami-pkg unpack mariadb-10.1.14-1 --checksum dbfcaa2001f6febd3c89b9edbdf6641a24f3a5b216219f44cf2da58b76b5992c
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/sbin:/opt/bitnami/$BITNAMI_APP_NAME/bin:$PATH

COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["harpoon", "start", "--foreground", "mariadb"]

VOLUME ["/bitnami/$BITNAMI_APP_NAME"]

EXPOSE 3306
