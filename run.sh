#!/bin/bash

pkill browsh
pkill firefox

echo "PORT: $PORT"

ps aux

sed -i "s/port = 4333/port = $PORT/" /app/.config/browsh/config.toml

# FROM: https://github.com/browsh-org/browsh/blob/master/Dockerfile
#
# Firefox behaves quite differently to normal on its first run, so by getting
# that over and done with here when there's no user to be dissapointed means
# that all future runs will be consistent.
# TERM=xterm script \
#   --return \
#   -c "/app/browsh" \
#   /dev/null \
#   >/dev/null & \
#   sleep 10

echo "Starting browsh in HTTP server mode..."

/app/browsh --http-server-mode
