#!/usr/bin/env bash

# Set bash options
set -e          # Exit immediately if a command exits with a non-zero status
set -u          # Treat unset variables as an error when substituting
set -o pipefail # Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value.

# This script makes certain assumptions:
# - The vikunja database is running in a docker container named pg-on-raspi
# - The database is named vikunja
# - The database user is named santosh
# Rest other things be configured below

TIMESTAMP=$(date +%Y%m%d%H%M%S)
DATE_TODAY=$(date +%Y%m%d)
TIMESTAMP_PRETTY=$(date +"%Y-%m-%dT%H:%M:%S%:z")

BACKUP_DIR=/home/santosh/backups/vikunja
BACKUP_TODAY_DIR=$BACKUP_DIR/$DATE_TODAY
DEST_IP=10.100.200.30
DEST_PORT=22
NTFY_SERVER=https://ntfy.santoshk.dev
NTFY_TOPIC=backup

# Service name for postgres in swarm
SERVICE_NAME=postgres_master
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Detecting CONTAINER_ID based on SERVICE_NAME=$SERVICE_NAME"
# Get the container ID or name of the container belonging to the service
CONTAINER_ID=$(docker ps --filter "name=${SERVICE_NAME}." --format "{{.ID}}" | head -n 1)
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): CONTAINER_ID=$CONTAINER_ID"

# backup and archive
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Initializing Vikunja Database Backup sequence on $TIMESTAMP_PRETTY"
mkdir -p $BACKUP_TODAY_DIR
cd $BACKUP_TODAY_DIR

echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Attempting to run pg_dump inside container"
docker exec "$CONTAINER_ID" pg_dump -U santosh vikunja >vikunja_$TIMESTAMP.sql
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Backup obtained, now compressing it to tar.gz"
tar -czvf vikunja_$TIMESTAMP.tar.gz vikunja_$TIMESTAMP.sql

echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Compression done, now deleting the sql file"
rm $BACKUP_TODAY_DIR/vikunja_$TIMESTAMP.sql

echo
echo

# Backup to desktop
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): rsyncing to $DEST_IP:$BACKUP_DIR"
rsync -rva --mkpath --progress -e "ssh -p $DEST_PORT" $BACKUP_DIR/ $DEST_IP:$BACKUP_DIR

curl -s -H "Title: Vikunja dababase backup at raspi 💻👨‍" \
	-H "Tags: info" \
	-d "Vikunja database backup at Raspberry Pi just finished" \
	$NTFY_SERVER/$NTFY_TOPIC
