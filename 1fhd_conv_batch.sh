#!/bin/bash

batch_config=(12 11 10 9 8 7 6 5 4)

for i in ${batch_config[@]}
do
    let "rate=$i*1000"
    echo "bitrate:$rate"
    let "max_rate=$rate*2"
    let "buf=$max_rate*2"
    if [[ ! -e output_batch/sintel_fhd_"$i"M.264 ]]
    then
        ./x264bin --fps 24 --vbv-bufsize "$buf" --vbv-maxrate "$max_rate"  --preset slow   --bitrate "$rate" --scenecut 0 --no-scenecut --pass 1 --min-keyint 48 --keyint 48   --input-res 3840x1744 --video-filter "resize:width=1920,height=1080" -o output_batch/sintel_fhd_"$i"M.264 sintel_4k.mov 
    else
        echo "[Warning] output_batch/sintel_fdh_$iM.264 File Exists"
    fi

done
