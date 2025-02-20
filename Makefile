default:
	@echo "Use one of the following commands:\n"
	@echo "make upload"

upload:
	rsync -u -avz --progress * nasq:/share/Docker/rtsp-timelapse/ --exclude LICENSE --exclude media/img/
	ssh nasq sudo chmod +x /share/Docker/rtsp-timelapse/cron-run.sh

snap:
	./snap.sh

leech_media:
	rsync -avz -u --remove-source-files nasq:/share/CACHEDEV1_DATA/Docker/rtsp-timelapse/media/img/*.jpg media/img/ --progress

timelapse:
	cd media/img; ffmpeg -framerate 12 -pattern_type glob -i '*.jpg' -c:v libx265 -pix_fmt yuv444p ../timelapse.mp4
