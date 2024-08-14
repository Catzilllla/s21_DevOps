FROM ubuntu:latest

# RUN apt update && apt-get install procps nginx -y
# RUN rm /etc/nginx/nginx.conf \
#     && rm -Rf /var/log/nginx/*
USER root
RUN apt-get update && apt-get install -y procps nginx sockstat
RUN useradd -u 1001 nginxt

RUN chown -R nginxt:nginxt /etc/nginx/nginx.conf; \
    chown -R nginxt:nginxt /var/log/nginx; \
    chown -R nginxt:nginxt /var/cache/nginx; \    
    chown -R nginxt:nginxt /etc/nginx; \
    touch /var/run/nginx.pid; \
    chown -R nginxt:nginxt /var/run/nginx.pid; \
    # rm -rf /var/lib/apt/lists
    mkdir /etc/nginx/html;

COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY ./index.html ./etc/nginx/html/index.html
COPY ./my-node/node_script.sh ./node_script.sh
RUN chmod +x ./node_script.sh

# USER nginxt

# ENTRYPOINT ["nginx -g "daemon off;"", "./node_script.sh"]
CMD ["/bin/bash", "-c", "./node_script.sh; nginx -g \"daemon off;\""]