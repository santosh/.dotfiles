## course-ntfy

This subfolder holds all the cron jobs which have integration with ntfy server with various online education providers.

This cron assumes that there is a ntfy server running at ntfy.santoshk.dev. By default the updates are send on `/courses` topic.

API keys are also needed for itegration to the course service.

Current crons available:

1. `udemy-ntfy.sh`: Notifies about ongoing courses on Udemy.
