# RTSP to JPEG capture container

## Preface

This is a part of low-cost home-built surveillance system. The container uses ffmpeg to grab videoframe from RTSP camera stream and put it into a volume, which can be shared with analytic system. Designed to be used with one container instance per camera (=url).

## Tested with

Designed with Google Cloud Console (docker x86).
Productoin use with Orange Pi + Armbian (docker armv7).

## Installation

Sources are stored here, you can edit them locally if needed.
Docker image is stored at https://hub.docker.com/r/alexanderlifanov/rtsp_capture .

```
docker push alexanderlifanov/rtsp_capture:latest
```

## Settings

During launch you need to parametrize the following things. 

### Env variables

**WORKURL** Shoud contain a FQDN link to RTSP stream, with login/password and flags, if needed. Please note, that for better stability - TCP transport is used.

Example: rtsp://admin:****@192.168.0.40:554/ch01.264?ptype=tcp

**CAMNAME** Should contain a name of camera. Will be used as a part of the stillshot filename, so should comply to standart naming conventions.

Example: CAM1

### Storage volume

Uses one volume for result storage, named **/outdata** inside container. Two pictures per cam are stored - last one and previous one. Can also be used for event image storage, so this folder has 777 permission.