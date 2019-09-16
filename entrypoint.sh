#!/bin/sh
ngssc insert /usr/share/nginx/html

if [ -z $NGSSC_DEPLOY_URL ]
then
  echo "No deploy url found, skipping"
else
  echo "Deploy url found, updating html files"
  # The replace patter uses ~, so you can't use this in the URL
  find . -name '*.html' -exec sed -i -e "s~src=\"(runtime|scripts|main|polyfills)~src=\"$NGSSC_DEPLOY_URL\1~g" {} \;
  find . -name '*.html' -exec sed -i -e "s~<base href=\"/~<base href=\"$NGSSC_DEPLOY_URL\1~g" {} \;
fi

nginx -g 'daemon off;'
