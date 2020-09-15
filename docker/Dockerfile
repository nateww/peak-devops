# No Dockerhub standard flask containers exist as of 2020-09-14 - NWW
FROM python:3.8-alpine

# This is heavily influenced by https://github.com/tiangolo/uwsgi-nginx-docker/blob/master/docker-images/python3.8-alpine.dockerfile

ENV PYTHON python3.8

RUN apk add --update --no-cache \
  uwsgi-python3

# The python packages.  Update to use requirements.txt in the actual
# project so devs can test things locally to match the actual builds.
RUN pip install Flask

COPY docker-entrypoint.sh start.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/start.sh"]

WORKDIR /app

ADD app.py /app/
ENV PYTHONPATH=/app
