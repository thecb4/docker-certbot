FROM python:2-alpine

RUN apt-get update && \
    apt-get install -y git

RUN git clone https://github.com/certbot/certbot /opt/certbot

RUN mkdir /etc/certbot && \
    mkdir /etc/certbot/configs && \
    mkdir /etc/certbot/cron

COPY renew.sh /etc/certbot/cron/renew.sh
COPY $DOMAIN_NAME.conf /etc/certbot/configs/$DOMAIN_NAME.conf certonly

RUN touch /var/log/cron.log

ENV DOMAIN_NAME example.com

CMD run.sh
