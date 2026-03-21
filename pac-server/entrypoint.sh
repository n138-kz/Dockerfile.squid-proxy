#!/bin/bash
set -e

# /etc/nginx/conf.d/default.conf が存在しない場合にバックアップから復元
if [ ! -f /etc/nginx/conf.d/default.conf ]; then
  echo "Config file not found. Restoring from /usr/share/nginx/config/..."
  cp -r /usr/share/nginx/config/* /etc/nginx/conf.d/
fi

echo "Starting Nginx..."
exec /usr/sbin/nginx -g "daemon off;"