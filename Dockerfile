FROM certbot/certbot

# RUN apt-get update && apt-get install -y git

# RUN git clone https://github.com/certbot/certbot /opt/certbot

ENV PATH=/usr/local/bin:/usr/bin:$PATH

RUN mkdir /etc/letsencrypt/cron

ENV DOMAIN_NAME=example.com

COPY renew.sh /etc/letsencrypt/cron/renew.sh
COPY run.sh /etc/letsencrypt/cron/run.sh

COPY example.com.conf /etc/letsencrypt/configs/example.com.conf

RUN touch /var/log/cron.log

VOLUME /etc/letsencrypt/configs

RUN /bin/bash -c 'groupadd -r letsencrypt'
RUN /bin/bash -c 'useradd --no-log-init -r -g letsencrypt letsencrypt'

RUN chown -R letsencrypt /etc/letsencrypt/

WORKDIR /etc/letsencrypt/cron

USER letsencrypt

ENTRYPOINT [ "/bin/bash", "./run.sh" ]

# CMD ./run.sh
