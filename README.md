## docker-nginx-gunicorn

![](https://img.shields.io/badge/python-3.7-blue.svg) 

A docker image of python API server with using Gunicorn and Nginx.

### Sample Start Script

```bash
$> docker run --rm \
    --env GUNICORN_OPTS='--bind=127.0.0.1:5000 --workers=4 --worker-class=gevent --log-level=debug --capture-output' \
    --publish 0.0.0.0:8080:80 \
    nginx-gunicorn-python-api
```

### Gunicorn Config

```
GUNICORN_OPTS='--bind=127.0.0.1:5000 --workers=4 --worker-class=gevent --log-level=debug --capture-output'
```

You can extent more Gunicorn varible in this line reference to [official document](https://docs.gunicorn.org/en/stable/settings.html)


### Nginx Config

The default setting is only provided as reverse proxy to `localhost:5000` with 4 worker in using [gevent](http://www.gevent.org/). If you need to custom your configuration, you may use `--volume` to mount the configuration file into your image or overwrite the configuration while you are building your image.

