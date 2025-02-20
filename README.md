# Timelapse RTSP Docker setup
These are scripts to create timelapse videos from RTSP feeds.
You can run this minimal Alpine-based container setup and trigger a cronjob externally to periodically take snapshots.

A second script uses ffmpeg to convert those snapshots to timelapse videos.

It uses `cesiumcz`'s repo for conversion scripts.

## Instructions
### 1. Adjust cron script
Adjust `cron-run.sh` so that it matches the path of your container host.
### 2. Create camera config file
Create a camera config file:
``` sh
cp cameras.example.txt cameras.txt
```
### 3. Insert camera url
Now insert the camera's RTSP URI into the new `cameras.txt` file.
- field 1: camera name
- field 2: jpg quality (1 is best, 31 is worst)
- field 3: Constant Rate Factor (CRF), default 28
- field 4: camera rtsp uri
### 4. Trigger cron
Let host cron daemon trigger `cron-run.sh` (with `crontab -e` or alike)
