#!/bin/bash

systemctl --user enable backup.service
systemctl --user enable backup.timer
systemctl --user start backup.timer
