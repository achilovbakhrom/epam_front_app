#!/bin/sh

NODE_MODULES_DIR=./node_modules

if [ -d $NODE_MODULES_DIR ]; then
    npm install
fi

npm run lint:fix && npm run prettier # && npm run test:jest	
