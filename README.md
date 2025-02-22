# Timelapse RTSP Docker setup
These are scripts to create timelapse videos from RTSP feeds.
You can run this minimal Alpine-based container setup and trigger a cronjob externally to periodically take snapshots.

It uses a script by `cesiumcz` for taking stills of the RTSP feed.
`ffmpeg` is used to convert those snapshots to timelapse videos.
A Python script removes black-ish pictures from the input.

## Usage
Download snaps from the snap location:
``` sh
make leech_media
```
Remove black-ish pictures from the picture input:
``` sh
make remove_blackish
```
Create timelapse from stills:
``` sh
make timelapse
```
Or all three actions combined:
``` sh
make refresh_timelapse
```

## Instructions for cron daemon RTSP feed snaps
### 1. Adjust cron script
Adjust `cron-run.sh` so that it matches the path of your container host.
### 2. Create camera config file
Create a camera config file:
``` sh
cp cameras.example.txt cameras.txt
```
### 3. Insert camera url
Now insert the camera's RTSP URI into the new `cameras.txt` file and remove the example content.
- field 1: Camera name
- field 2: JPG quality (1 is best, 31 is worst)
- field 3: Constant Rate Factor (CRF), default is 28
- field 4: Camera RTSP URI
### 4. Trigger cron
Let host cron daemon trigger `cron-run.sh` by adding a cronjob with `crontab -e` or alike.
