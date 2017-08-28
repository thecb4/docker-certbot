#!/bin/sh

cd /opt/certbot/
if [ "$TEST_CERT" == "true" ]; then
	./certbot-auto --config --test-cert /etc/letsencrypt/configs/$DOMAIN_NAME.conf certonly
else
	./certbot-auto --config /etc/letsencrypt/configs/$DOMAIN_NAME.conf certonly
fi

if [ $? -ne 0 ]
 then
        ERRORLOG=`tail /var/log/letsencrypt/letsencrypt.log`
        echo -e "The Let's Encrypt cert has not been renewed! \n \n" \
                 $ERRORLOG
 else
        nginx -s reload
fi

exit 0
