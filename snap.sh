#!/usr/bin/env bash
docker compose run --rm app bash -c "sed -i '32 s/\&//' snap.sh && chmod +x snap.sh && ./snap.sh"
