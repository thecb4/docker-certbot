FROM certbot/certbot

# RUN apt-get update && apt-get install -y git

# RUN git clone https://github.com/certbot/certbot /opt/certbot

RUN mkdir /etc/letsencrypt/cron

ENV DOMAIN_NAME=example.com

COPY renew.sh /etc/letsencrypt/cron/renew.sh
COPY run.sh /etc/letsencrypt/cron/run.sh

COPY example.com.conf /etc/letsencrypt/configs/example.com.conf

RUN touch /var/log/cron.log

VOLUME /etc/letsencrypt/configs

RUN useradd --create-home --home-dir /usr/local/letsencrypt --shell /bin/bash letsencrypt
RUN adduser letsencrypt sudo

RUN chown -R letsencrypt /etc/letsencrypt/

WORKDIR /etc/letsencrypt/cron

USER letsencrypt

ENTRYPOINT [ "/bin/bash", "./run.sh" ]

# CMD ./run.sh
