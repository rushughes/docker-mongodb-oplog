#!/bin/sh

# Initialize replicaSet
/init_repl.sh || exit $?

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

exec su -s /bin/sh -c "exec mongod --bind_ip_all --replSet rs0" mongodb
