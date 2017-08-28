FROM certbot/certbot

# RUN apt-get update && apt-get install -y git

# RUN git clone https://github.com/certbot/certbot /opt/certbot

RUN mkdir /etc/letsencrypt && mkdir /etc/letsencrypt/configs && mkdir /etc/letsencrypt/cron

ENV DOMAIN_NAME=example.com

COPY renew.sh /etc/letsencrypt/cron/renew.sh
COPY run.sh /etc/letsencrypt/cron/run.sh

COPY example.com.conf /etc/letsencrypt/configs/example.com.conf

RUN touch /var/log/cron.log

VOLUME /etc/letsencrypt/configs

WORKDIR /etc/letsencrypt/cron/

CMD run.sh
