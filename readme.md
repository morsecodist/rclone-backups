# rclone-backups

Configuration files for running cloud backups with rclone as a systemd timer + service. This service runs `rclone sync` every hour on your home directory. It is intended to sync with a cloud storage bucket compatible with S3, like digitalocean spaces.

## Requirements

- rclone
- systemd

## Usage

1. Configure your rclone remote: https://rclone.org/docs/
2. Run `make install`
