#!/usr/bin/env bash
docker compose run app bash -c "sed -i '32 s/\&//' snap.sh && chmod +x snap.sh && ./snap.sh"
