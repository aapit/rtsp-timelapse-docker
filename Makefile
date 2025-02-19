default:
	@echo "Use one of the following commands:\n"
	@echo "make upload"

upload:
	rsync -u -avz --progress * nasq:/share/Docker/rtsp-timelapse/ --exclude LICENSE

snap:
	./snap.sh

leech_media:
	rsync -avz -u --remove-source-files nasq:/share/CACHEDEV1_DATA/Docker/rtsp-timelapse/media/img/*.jpg media/img/ --progress
