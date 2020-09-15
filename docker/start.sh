#!/bin/sh
uwsgi --plugin python3 \
   --http-socket :5000 \
   --uid uwsgi         \
   --master            \
   --module app:app
