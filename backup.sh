#!/bin/bash

LOGFILE=last-backup.log
rclone sync --max-size 1g --exclude $LOGFILE ~/ RCLONE_REMOTE:BUCKET/START_DATE 2> ~/$LOGFILE

date > ~/last-backup.txt
