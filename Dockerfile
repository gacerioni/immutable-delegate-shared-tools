FROM redhat/ubi8-minimal:8.4

RUN microdnf update \
  && microdnf install --nodocs \
    procps \
    hostname \
    lsof \
    findutils \
    tar \
    unzip \
  && rm -rf /var/cache/yum \
  && microdnf clean all \
  && mkdir -p /opt/gabs-example/

WORKDIR /opt/gabs-example

RUN curl -O -L  https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip
RUN unzip terraform_1.3.3_linux_amd64.zip
RUN rm terraform_1.3.3_linux_amd64.zip
