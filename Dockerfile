FROM alpine:latest
RUN apk add --update nginx && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /tmp/nginx


COPY files/nginx.conf /usr/local/etc/nginx/nginx.conf
COPY files/default.conf /usr/local/etc/nginx/conf.d/default.conf
ADD files/index.html /usr/local/share/nginx/html/


EXPOSE 80/tcp

ENTRYPOINT [“nginx”]
CMD [“-g”, “daemon off;”]