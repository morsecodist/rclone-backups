#!/bin/bash

./stop.sh

rm ~/.config/systemd/user/backup.service
rm ~/.config/systemd/user/backup.timer
rm ~/bin/backup.sh
