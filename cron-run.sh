#!/usr/bin/env sh
DOCKER=/share/CACHEDEV1_DATA/.qpkg/container-station/bin/docker
cd /share/CACHEDEV1_DATA/Docker/rtsp-timelapse && $DOCKER compose run --rm --name timelapse-snap app bash -c "sed -i '32 s/\&//' snap.sh && chmod +x snap.sh && ./snap.sh" ; $DOCKER container prune -f > /dev/null 2>&1
