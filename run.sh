#!/bin/bash

/etc/certbot/cron/renew.sh

crontab -e "0 0 1 JAN,MAR,MAY,JUL,SEP,NOV * /etc/certbot/cron/renew.sh"
