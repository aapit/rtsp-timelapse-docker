default:
	@echo "Use one of the following commands:\n"
	@echo "make upload"

upload:
	rsync -u -avz --progress * nasq:/share/Docker/rtsp-timelapse/ --exclude LICENSE --exclude media/ --exclude venv/
	ssh nasq sudo chmod +x /share/Docker/rtsp-timelapse/cron-run.sh

snap:
	./snap.sh

leech_media:
	rsync -avz -u --remove-source-files nasq:/share/CACHEDEV1_DATA/Docker/rtsp-timelapse/media/img/*.jpg media/img/ --progress

timelapse:
	ffmpeg -y -framerate 24 -pattern_type glob -i 'media/img/*.jpg' -c:v libx265 -pix_fmt yuvj420p media/timelapse.mp4

remove_blackish:
	@echo "Checking for blackish images..."
	@sh -c 'counter=0; total=$$(/bin/ls media/img/*.jpg|wc -l|xargs); for f in media/img/*.jpg; do counter=`expr $$counter + 1`; echo "Checking $$counter of $$total"; [ "$$(./image-is-blackish.py $$f)" = "1" ] && (rm -f $$f && echo "removed $$f"); done; true'

refresh_timelapse: leech_media remove_blackish timelapse
