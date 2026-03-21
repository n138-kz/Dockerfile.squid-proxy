#!/bin/bash
set -e

# /etc/squid/squid.conf が存在しない場合にバックアップから復元
if [ ! -f /etc/squid/squid.conf ]; then
  echo "Config file not found. Restoring from /usr/share/squid/config/..."
  cp -r /usr/share/squid/config/* /etc/squid/
fi

touch /var/log/squid/access.log /var/log/squid/cache.log
chown proxy:proxy /var/log/squid/access.log /var/log/squid/cache.log

tail -f /var/log/squid/access.log > /dev/stdout &
tail -f /var/log/squid/cache.log > /dev/stderr &

# マウントされたディレクトリの所有権を適切に設定
chown -R proxy:proxy /etc/squid /var/spool/squid /var/log/squid

# キャッシュディレクトリの初期化（未初期化の場合のみ実行）
if [ ! -d /var/spool/squid/00 ]; then
  echo "Initializing cache directories..."
  /usr/sbin/squid -z -N
fi

echo "Starting Squid..."
exec /usr/sbin/squid -N -d 1 -f /etc/squid/squid.conf
