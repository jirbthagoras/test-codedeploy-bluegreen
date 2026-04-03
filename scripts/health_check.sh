#!/bin/bash
curl -f http://localhost/ || exit 1
echo "Health check OK"