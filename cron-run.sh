#!/usr/bin/env sh
cd /share/CACHEDEV1_DATA/Docker/rtsp-timelapse && \
/share/CACHEDEV1_DATA/.qpkg/container-station/bin/docker compose run --rm app bash -c "sed -i '32 s/\&//' snap.sh && chmod +x snap.sh && ./snap.sh" && \
cd -
