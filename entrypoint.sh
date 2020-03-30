#!/bin/bash
set -ex

nginx

gunicorn $GUNICORN_OPTS app:app
