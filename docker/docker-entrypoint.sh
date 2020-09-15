#!/bin/sh

# Alpine requires explicitly updating the PYTHONPATH otherwise uWSGI
# can't import Flask
if [ -n "$PYTHON" ]; then
  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/$PYTHON/site-packages:/usr/lib/$PYTHON/site-packages
fi

exec "$@"
