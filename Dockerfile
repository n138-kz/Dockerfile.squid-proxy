FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y squid && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/spool/squid /var/log/squid \
	&& chown -R proxy:proxy /var/spool/squid /var/log/squid

RUN mkdir -p /usr/share/squid/config && cp -r /etc/squid/* /usr/share/squid/config/

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
