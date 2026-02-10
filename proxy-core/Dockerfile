FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y squid

RUN mkdir -p /var/spool/squid \
	&& chown -R proxy:proxy /var/spool/squid \
	&& chmod -R 755 /var/spool/squid
