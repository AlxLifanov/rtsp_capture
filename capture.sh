mv -f /outdata/$CAMNAME.jpg /outdata/$CAMNAME.previous.jpg
ffmpeg -y -rtsp_transport tcp -i $WORKURL -f image2 -frames:v 1 /outdata/$CAMNAME.jpg
