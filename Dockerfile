FROM certbot/certbot

# RUN apt-get update && apt-get install -y git

# RUN git clone https://github.com/certbot/certbot /opt/certbot

RUN mkdir /etc/letsencrypt/cron

ENV DOMAIN_NAME=example.com

COPY renew.sh /etc/letsencrypt/cron/renew.sh
COPY run.sh /etc/letsencrypt/cron/run.sh

COPY example.com.conf /etc/letsencrypt/configs/example.com.conf

RUN touch /var/log/cron.log

# VOLUME /etc/letsencrypt/configs

#user
RUN echo 'root:root' |chpasswd
# RUN adduser -S letsencrypt \
#     && echo "letsencrypt ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
#     && echo 'letsencrypt:letsencrypt' | chpasswd

# RUN chown -R letsencrypt /etc/letsencrypt

# USER letsencrypt

WORKDIR /etc/letsencrypt/cron

# ENTRYPOINT "./run.sh"

ENTRYPOINT ["/bin/sh","/etc/letsencrypt/cron/run.sh"]

CMD ["/bin/sh"]
