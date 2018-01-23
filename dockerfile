FROM centos:latest
MAINTAINER SA <satish.aherkar@gmail.com>
ENV VAULT_VERSION 0.7.3
ENV VAULT_ADDR "http://127.0.0.1:8200"
RUN yum install epel-release -y
RUN yum update -y
RUN yum install unzip -y
RUN yum install supervisor -y
ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip /tmp/vault.zip
RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY vaultconfig.hcl /opt/vault/
EXPOSE 8200
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf
