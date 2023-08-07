#!/bin/bash
cd /home/container

# Copy the client code from the source directory, if it does not exist yet.
if [ ! -e /home/container/client ]; then
  cp -r /opt/pokemon-showdown/client/ /home/container/client
fi

# Ensure Caddy's directories exist
mkdir -p /home/container/caddy/config
mkdir -p /home/container/caddy/data

# Build the client code
cd /home/container/client
node build

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server; probably should be done with something like `caddy file-server --listen :{{SERVER_PORT}}`
${MODIFIED_STARTUP}