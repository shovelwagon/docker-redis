#!/bin/bash

set -e

if [ -z "$REDIS_PORT" ]
then
    echo >&2 'error: missing REDIS_PORT environment variables'
    exit 1
fi

if [ -z "$REDIS_DIRECTORY" ]
then
    echo >&2 'error: missing REDIS_DIRECTORY environment variables'
    exit 1
fi

if [ -z "$REDIS_APPENDONLY" ]
then
    echo >&2 'error: missing REDIS_APPENDONLY environment variables'
    exit 1
fi

sed \
    -i \
    -e "s#REDIS_PORT#$REDIS_PORT#" \
    -e "s#REDIS_DIRECTORY#$REDIS_DIRECTORY#" \
    -e "s#REDIS_APPENDONLY#$REDIS_APPENDONLY#" \
/usr/local/etc/redis/redis.conf

exec "$@"
