#!/bin/bash
cd /home/container

# Create config files & directories
if [ ! -e /home/container/server/config/avatars ]; then
  cp -r /opt/pokemon-showdown/server/config.template/avatars /home/container/server/config
fi
if [ ! -e /home/container/server/config/chat-plugins ]; then
  cp -r /opt/pokemon-showdown/server/config.template/chat-plugins /home/container/server/config
fi
if [ ! -e /home/container/server/config/ladders ]; then
  cp -r /opt/pokemon-showdown/server/config.template/ladders /home/container/server/config
fi
if [ ! -e /home/container/server/config/hosts.csv ]; then
  cp -r /opt/pokemon-showdown/server/config.template/hosts.csv /home/container/server/config
fi
if [ ! -e /home/container/server/config/proxies.csv ]; then
  cp -r /opt/pokemon-showdown/server/config.template/proxies.csv /home/container/server/config
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}