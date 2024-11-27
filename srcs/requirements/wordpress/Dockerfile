FROM debian:buster

WORKDIR /var/www/html

COPY ./tools/install_wp.sh .

RUN apt update && \
	apt install php php-fpm php-json php-gd php-mysql php-mbstring php-xml curl sendmail -y && \
	chmod +x install_wp.sh

EXPOSE 9000

CMD [ "./install_wp.sh" ]