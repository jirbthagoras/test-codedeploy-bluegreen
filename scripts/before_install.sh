#!/bin/bash
set -e

echo "[BeforeInstall] Memulai persiapan deployment..."

# Install nginx jika belum ada
if ! command -v nginx &> /dev/null; then
  echo "[BeforeInstall] nginx tidak ditemukan, menginstall..."
  apt-get update -y
  apt-get install nginx -y
  systemctl enable nginx
  echo "[BeforeInstall] nginx berhasil diinstall."
else
  echo "[BeforeInstall] nginx sudah terinstall, melanjutkan..."
fi

# Pastikan direktori tujuan ada
mkdir -p /var/www/html

# Backup file lama jika ada
if [ -f /var/www/html/index.html ]; then
  BACKUP_NAME="/tmp/index.html.bak.$(date +%Y%m%d_%H%M%S)"
  cp /var/www/html/index.html "$BACKUP_NAME"
  echo "[BeforeInstall] Backup disimpan: $BACKUP_NAME"
fi

echo "[BeforeInstall] Selesai."
