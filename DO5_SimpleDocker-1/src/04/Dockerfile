FROM nginx

RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./runscript.sh .

ENTRYPOINT ["sh", "./runscript.sh"]