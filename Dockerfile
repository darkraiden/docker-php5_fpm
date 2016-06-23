FROM debian:jessie

RUN apt-get update && \
    apt-get install -y php5 \
                       php5-fpm \
                    --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY ./www.conf /etc/php5/fpm/pool.d/www.conf

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

EXPOSE 9000
CMD ["php5-fpm"]
