#!/bin/bash

if [ ! -e /opt/init ]; then
    bin/rake db:setup
    bin/rake rails:template LOCATION=ecs_vip.rb
    bin/rake rails:template LOCATION=vip_init.rb

    touch /opt/init
fi

exec rackup -o "${HOSTNAME}" -p "${ECS_PORT}"
