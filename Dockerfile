FROM certbot/certbot

# RUN apt-get update && apt-get install -y git

# RUN git clone https://github.com/certbot/certbot /opt/certbot

RUN mkdir /etc/certbot && mkdir /etc/certbot/configs && mkdir /etc/certbot/cron

ENV DOMAIN_NAME=example.com

COPY renew.sh /etc/certbot/cron/renew.sh
COPY example.com.conf /etc/certbot/configs/example.com.conf

RUN touch /var/log/cron.log

CMD run.sh
