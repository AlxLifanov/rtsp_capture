FROM alpine:latest
MAINTAINER Alexander Lifanov <alx.lifanov@gmail.com>
ENV WORKURL "rstp://127.0.0.1"
ENV CAMNAME "CAM1"
COPY capture.sh /home/capture.sh
RUN apk add ffmpeg 
RUN mkdir /outdata
RUN chmod 777 /home/capture.sh
RUN chmod -R 777 /outdata
RUN echo "* * * * * /home/capture.sh"  >> /var/spool/cron/crontabs/root
VOLUME /outdata
CMD ["/usr/sbin/crond", "-f"]