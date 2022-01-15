#!/bin/bash

set -euxo pipefail

MISSING_VARS=false
if [ -z ${BUCKET+x} ]
then
    echo "BUCKET is unset, please set it to the name of your cloud storage bucket"
    MISSING_VARS=true
fi

if [ -z ${RCLONE_REMOTE+x} ]
then
    echo "RCLONE_REMOTE is unset, please set it to the name of your rclone remote"
    MISSING_VARS=true
fi

$MISSING_VARS && exit 1

rclone 2> /dev/null || (echo rclone is required install it from https://rclone.org/install/; exit 1)
if [ $(rclone --version | head -n 1) == "rclone v1.57.0" ]; echo rclone v1.57.0 is required ; fi

mkdir -p ~/.config/systemd/user 2> /dev/null || true
cp backup.service ~/.config/systemd/user/backup.service
cp backup.timer ~/.config/systemd/user/backup.timer

mkdir ~/bin 2> /dev/null || true
START_DATE=$(date +"%F")
cat backup.sh | sed -e "s/BUCKET/$BUCKET/" -e "s/START_DATE/$START_DATE/" -e "s/RCLONE_REMOTE/$RCLONE_REMOTE/" > ~/bin/backup.sh
chmod +x ~/bin/backup.sh

echo running initial sync, this may take some time
~/bin/backup.sh
echo initial backup complete, enabling service

./start.sh
