#!/bin/bash
cd /home/container

mkdir -p /home/container/server/dist
mkdir -p /home/container/server/config
ln -sf /home/container/server/node_modules /opt/pokemon-showdown/server

# Create config files & directories
if [ ! -e /home/container/server/config/avatars ]; then
  cp -r /opt/pokemon-showdown/server/config.template/avatars /home/container/server/config
fi
if [ ! -e /home/container/server/config/avatars.json ]; then
  echo "{}" > /home/container/server/config/avatars.json
fi
if [ ! -e /home/container/server/config/chat-plugins ]; then
  cp -r /opt/pokemon-showdown/server/config.template/chat-plugins /home/container/server/config
fi
if [ ! -e /home/container/server/config/chatrooms.json ]; then
  echo "{}" > /home/container/server/config/chatrooms.json
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
if [ ! -e /home/container/server/config/usergroups.csv ]; then
  touch /home/container/server/config/usergroups.csv
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
