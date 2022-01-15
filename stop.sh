#!/bin/bash

systemctl --user disable backup.service
systemctl --user disable backup.timer
