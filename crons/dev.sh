#!bin/bash

# Monthly cleanup scheme for master_node of development environment.

# 1. Clean docker cache
docker system prune -f

# 2. Clean yum cache
sudo rm -rf /var/cache/yum

# 3. Clean /tmp (files older than 15 days)
find /tmp -ctime +15 -exec rm -rf {} +
