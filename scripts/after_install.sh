#!/bin/bash
set -e

echo "[AfterInstall] Mengatur permission dan reload nginx..."

# Set ownership ke www-data (Ubuntu/Debian default nginx user)
chown -R ec2-user:ec2-user /var/www/html/

# Set permission file
find /var/www/html/ -type f -exec chmod 644 {} \;
find /var/www/html/ -type d -exec chmod 755 {} \;

# Pastikan nginx config valid sebelum reload
nginx -t

# Reload nginx (lebih aman dari restart, tidak drop koneksi aktif)
systemctl reload nginx

echo "[AfterInstall] nginx berhasil direload."
echo "[AfterInstall] Selesai."
