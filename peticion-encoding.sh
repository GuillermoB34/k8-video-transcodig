#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <number_of_requests>"
    exit 1
fi

for i in {1..$1}; do 
    curl -v "http://192.168.56.3:30080/x264-fn-events" \
    -X POST \
    -H "Ce-Id: $i" \
    -H "Ce-specversion: 1.0" \
    -H "Ce-Type: x264" \
    -H "Ce-Source: curl" \
    -H "Content-Type: application/json" \
    -d '{
    "sourceUrl":"https://routerdi1315.uv.es/video/video.mp4",
    "crf":"'$i'",
    "frameRate":"23.98",
    "videoNameDestination":"video-crf-'$i'.mp4",
    "destUrl":"http://svc-upload-nginx:8080/upload",
    "bucketParamName":"bucket",
    "bucketParamValue":"encodedVideos"
    }'
done