#!/bin/sh
uwsgi --plugin python3         \
   --socket /tmp/flaskapp.sock \
   --uid uwsgi                 \
   --master                    \
   --module app:app
