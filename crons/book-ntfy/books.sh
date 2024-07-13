#!/usr/bin/env bash

# Set bash options
set -e          # Exit immediately if a command exits with a non-zero status
set -u          # Treat unset variables as an error when substituting
set -o pipefail # Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value.

ntfy_server=https://ntfy.santoshk.dev
topic=books

echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Sending reminder to read books on $topic..."

echo
echo

curl -s -H "Title: Feeling like reading a book this weekend? 📚" \
	-H "Tags: book" \
	-d "Here are the current recommendation:

1. Crafting Interpreters: https://vikunja.santoshk.dev/tasks/5 💻
2. Linux from Scratch: https://www.linuxfromscratch.org/lfs/view/stable-systemd/chapter02/creatingpartition.html
3. Hands-On GPU Computing With Python: https://nextcloud.santoshk.dev/apps/files/files/204?dir=/&openfile=true" \
	$ntfy_server/$topic
