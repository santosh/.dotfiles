#!/usr/bin/env bash

# Set bash options
set -e          # Exit immediately if a command exits with a non-zero status
set -u          # Treat unset variables as an error when substituting
set -o pipefail # Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value.

timestamp_pretty=$(date +"%Y-%m-%d %H:%M:%S%:z")
ntfy_server=https://ntfy.santoshk.dev
course_topic=courses

echo "$(date +"%Y-%m-%d %H:%M:%S%:z"): Sending scheduled course reminder on $course_topic..."

echo
echo

curl -s -H "Title: New courses to learn from 💻👨‍" \
	-H "Actions: view, Start learning, https://www.udemy.com, clear=true" \
	-d "Here are the courses you are taking:

1. Kubernetes for Application Developer: https://www.udemy.com/course/certified-kubernetes-application-developer/
2. Linux Foundation - CKAD" \
	$ntfy_server/$course_topic
