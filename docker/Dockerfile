# No Dockerhub standard flask containers exist as of 2020-09-14 - NWW
FROM python:3.8-alpine

# This is heavily influenced by https://github.com/tiangolo/uwsgi-nginx-docker/blob/master/docker-images/python3.8-alpine.dockerfile

ENV PYTHON python3.8

RUN apk add --update --no-cache \
  supervisor                    \
  uwsgi-python3

# Configuration files for supervisor and uWSGI
COPY supervisord.conf /etc/supervisord.conf
COPY uwsgi.ini /etc/uwsgi/

# Install and configure NGINX (stdout/stderr links cause request and error logs
# to be sent to stdout/stderr instead of a logfile)
RUN apk add --update --no-cache nginx &&            \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
COPY nginx.conf /etc/nginx/nginx.conf
COPY flask_app.conf /etc/nginx/sites-enabled/

# The python packages.  Update to use requirements.txt in the actual
# project so devs can test things locally to match the actual builds.
RUN pip install Flask

COPY docker-entrypoint.sh start.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/start.sh"]

WORKDIR /app

ADD app.py /app/
ENV PYTHONPATH=/app
