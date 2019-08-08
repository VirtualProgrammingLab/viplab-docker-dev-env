#!/bin/bash

if [ ! -e /opt/init ]; then
    bin/rake db:setup

    touch /opt/init
fi

exec rackup -o "${HOSTNAME}" -p "${ECS_PORT}"