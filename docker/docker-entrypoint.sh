#!/bin/sh

# Initialize missing user files
IFS="," RESOURCES="characters,chats,User Avatars,settings.json"
for R in $RESOURCES; do
  if [ ! -e "config/$R" ]; then
    echo "Resource not found, copying from defaults: $R"
    cp -r "public/$R.default" "config/$R"
  fi
done

# Start the server
exec node server.js
