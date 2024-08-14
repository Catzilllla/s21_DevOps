FROM nginx:latest

# Удаляем файлы конфигурации и логи nginx
RUN rm /etc/nginx/nginx.conf \
    && rm -Rf /var/log/nginx/*

# Устанавливаем переменные окружения
ENV NGINX_PORT=80 \
    NGINX_WORKER_PROCESSES=auto \
    NGINX_WORKER_CONNECTIONS=1024

# Определяем порт, который будет использоваться при запуске контейнера
EXPOSE $NGINX_PORT

WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c
COPY ./run.sh /home/run.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists
USER nginx
ENTRYPOINT ["sh", "./run.sh"]
HEALTHCHECK NONE

