#!/bin/bash
set -e

echo "[ValidateService] Menjalankan health check..."

# Tunggu sebentar agar nginx siap
sleep 3

# Cek status nginx service
if ! systemctl is-active --quiet nginx; then
  echo "[ValidateService] GAGAL: nginx tidak berjalan!"
  exit 1
fi
echo "[ValidateService] nginx service: aktif"

# Cek HTTP response dari localhost
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)

if [ "$HTTP_CODE" -ne 200 ]; then
  echo "[ValidateService] GAGAL: HTTP response code $HTTP_CODE (diharapkan 200)"
  exit 1
fi

echo "[ValidateService] HTTP health check: OK (HTTP $HTTP_CODE)"
echo "[ValidateService] Deployment berhasil divalidasi!"
