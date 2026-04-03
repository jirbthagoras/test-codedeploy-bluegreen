#!/bin/bash
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl reload nginx
sudo systemctl restart nginx
echo "server jalan" 