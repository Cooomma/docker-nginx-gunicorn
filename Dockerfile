FROM python:3.7.7-slim-buster

# Set version in Env Var
ENV NGINX_VERSION=1.14.2-2+deb10u1
ENV GUNICORN_VERSION=20.0.4
ENV GEVENT_VERSION=1.4.0
ENV APP_ENVIRONMENT production

# Install Nginx
RUN apt update && apt install -y nginx=${NGINX_VERSION} && rm -rf /var/lib/apt/lists/*
RUN pip install gunicorn==${GUNICORN_VERSION} gevent==${GEVENT_VERSION} --no-cache-dir

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
COPY ./entrypoint.sh /usr/local/bin
RUN chmod 755 //usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
