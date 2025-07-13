#!/bin/bash
set -euo pipefail

mkdir -p backup
tar -xzf backup.tar.gz -C backup
find backup -type f -print0 | xargs -0 chmod 0664
find backup -type d -print0| xargs -0 chmod 0775
chown -R bha5kar:bha5kar backup
tar -czf fixed-archive.tar.gz backup