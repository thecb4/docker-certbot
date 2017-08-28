#!/bin/bash
chown -R letsencrypt /etc/letsencrypt
/etc/letsencrypt/cron/renew.sh
crontab -e "0 0 1 JAN,MAR,MAY,JUL,SEP,NOV * /etc/letsencrypt/cron/renew.sh"
