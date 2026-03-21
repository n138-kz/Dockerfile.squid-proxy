FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/config && cp -r /etc/nginx/conf.d/* /usr/share/nginx/config/

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
