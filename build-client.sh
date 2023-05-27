#!/bin/bash

export ENV_CONFIGURATION=production

echo "Build environment is $ENV_CONFIGURATION"

BUILD_DIR=./dist

app_build_file=$BUILD_DIR/client-app.zip

if [ -e "${app_build_file}" ]; then
	rm "${app_build_file}"
	echo "Old version of the app was removed!"
fi

npm run build --configuration=$ENV_CONFIGURATION --output-path=$BUILD_DIR -y
7z a -tzip $app_build_file $BUILD_DIR/app/*
echo "Client app was built with $ENV_CONFIGURATION configuration."



