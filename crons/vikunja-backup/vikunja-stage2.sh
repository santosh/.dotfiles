#!/usr/bin/env bash

# Set bash options
set -e          # Exit immediately if a command exits with a non-zero status
set -u          # Treat unset variables as an error when substituting
set -o pipefail # Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value.

# This script is a sequence to vikunja-raspi.sh, and continues to replilcate the backup on more locations
# This is done so that credentials, like the one of s3 is not spread over multiple hosts.

# Note: This script is prepared to run on a daily basis. It is assumed that:
# - the backup is already created by vikunja-raspi.sh
# - the HDD is mount to /mnt/nas
# - the NAS is mount to /mnt/pinas
# - the S3 bucket is created and the credentials are stored in ~/.aws/credentials
# Some of the configuration can be changed below.

# Define paths
date_today=$(date +%Y%m%d)
timestamp_pretty=$(date +"%Y-%m-%d %H:%M:%S%:z")
backup_dir=$HOME/backups/vikunja
hdd_backup_dir=/mnt/nas/backups/vikunja
nas_backup_dir=/mnt/pinas/backups/vikunja
s3_backup_dir=s3://selfhosted-backups/vikunja

mkdir -p $backup_dir $hdd_backup_dir $nas_backup_dir

echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Backing up Vikunja Database on NAS, S3, and secondary HDD..."

# Finding part
echo
echo

# Find directory with today's date
backup_today_dir=$backup_dir/$date_today

cd $backup_today_dir

# Define function for aws-cli with proper volume mounts
aws() {
	docker run --rm -v $HOME/.aws:/root/.aws:z -v $(pwd):/aws amazon/aws-cli "$@"
}

# Find the latest backup file
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Finding the latest backup file..."
latest_backup=$(ls -1 $backup_today_dir | sort -n -t _ -k 2 | tail -n1)
echo "Latest backup file: $latest_backup"

# Generate full path of the latest backup file
latest_backup_path=$backup_today_dir/$latest_backup
echo "Latest backup file absolute path: $latest_backup_path"

# Publishing part
echo
echo

# Backup to HDD
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Copying $latest_backup to HDD"
rsync -rva --mkpath --progress $latest_backup_path $hdd_backup_dir

# Backup to NAS
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Copying $latest_backup to NAS"
rsync -rva --mkpath --progress $latest_backup_path $nas_backup_dir

# Backup to S3
echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Copying $latest_backup to S3"
aws s3 cp $latest_backup $s3_backup_dir/
