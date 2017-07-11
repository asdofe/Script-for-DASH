#!/bin/bash
raw_batch_file=$(find . -name '*_output.mp4')
mpd_filename="assets/stream.mpd"
echo "======================================"
echo "MPD files $mpd_filename contains the following mp4 file"
echo "$raw_batch_file"
echo "======================================"
batch_file=$(echo "$raw_batch_file"| tr '\n' ' ')


MP4Box -dash 2000 -rap -segment-name s_%s -url-template -out $mpd_filename $batch_file

