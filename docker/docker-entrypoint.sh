#!/bin/sh

if [ "$1" = 'flask' ]; then
    if [ -z "${FLASK_APP}" ]; then
        echo "FLASK_APP unset or empty"
        exit 1
    fi
fi

exec "$@"
