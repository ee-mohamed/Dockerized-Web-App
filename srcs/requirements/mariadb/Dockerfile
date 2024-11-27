FROM debian:buster

COPY ./tools/start_db.sh .
COPY ./tools/init_db.sql .

RUN apt update && \
	apt install mariadb-server -y && \
	chmod +x start_db.sh

EXPOSE 3306

CMD [ "./start_db.sh" ]