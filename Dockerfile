FROM alpine:3
MAINTAINER David Spreekmeester <david@spreekmeester.nl>
RUN addgroup _webcam && adduser -g "Webcam routine" -S -h /var/webcam/ -s /sbin/nologin _webcam -G _webcam && \
install -d -m 770 -o root -g _webcam /var/webcam/
WORKDIR /tmp/
RUN apk update && apk add --no-cache file git bash ffmpeg && \
git clone https://github.com/cesiumcz/rtsp-timelapse.git
WORKDIR /tmp/rtsp-timelapse/
RUN mv snap.bash snap.sh && mv render.bash render.sh && \
install -d -m 755 -o root -g _webcam /usr/local/webcam/ && \
install -m 770 -o root -g _webcam conf.sh /usr/local/webcam/ && \
install -m 754 -o root -g _webcam snap.sh /usr/local/webcam/ && \
install -m 754 -o root -g _webcam render.sh /usr/local/webcam/ && \
rm -rf /tmp/rtsp-timelapse/
WORKDIR /usr/local/webcam/
RUN mkdir -p /var/webcam/grow3 && touch /var/webcam/grow3/timelapse.hevc
COPY cameras.txt /usr/local/webcam/
