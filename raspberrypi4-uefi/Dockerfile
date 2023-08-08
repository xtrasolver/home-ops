FROM docker.io/library/alpine:latest

COPY ./serials /serials

RUN apk add --update --no-cache unzip \
 && mkdir /rpi4 \
 && cd /rpi4 \
 && wget https://github.com/pftf/RPi4/releases/download/v1.35/RPi4_UEFI_Firmware_v1.35.zip \
 && ls \
 && unzip RPi4_UEFI_Firmware_v1.35.zip \
 && rm RPi4_UEFI_Firmware_v1.35.zip \
 && mkdir /tftp \
 && ls /serials | while read serial; do mkdir /tftp/$serial && cp -r /rpi4/* /tftp/$serial && cp -r /serials/$serial/* /tftp/$serial/; done
