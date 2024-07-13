# planka-backup

My homelab has an instance of Planka running. Planka is an open source alternative to Trello.

Two files can be found in this directory:

- `planka-raspi.sh` - fetches postgres database from the database instance and push it to desktop machine.
- `planka-desktop.sh` - start with the second replication, desktop cron replicates again on home nas, secondary HDD, as well as S3

The first script is supposed to run more frequently than the desktop one. For an example, raspi can run every 3-6 hours, and the desktop once every day. Totally depends on how dependent you are on your installation.
