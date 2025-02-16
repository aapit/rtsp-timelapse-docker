#!/usr/bin/env sh
cd /share/CACHEDEV1_DATA/Docker/rtsp-timelapse-docker && \
docker compose exec app /usr/local/webcam/snap.sh && \
cd -
