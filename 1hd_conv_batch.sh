#!/bin/bash

batch_config=(3 2 1)

for i in ${batch_config[@]}
do
    let "rate=$i*1000"
    echo "bitrate:$rate"
    let "max_rate=$rate*2"
    let "buf=$max_rate*2"
    if [[ ! -e output_batch/sintel_2k_"$i"M.264 ]]
    then
        ./x264bin --fps 24 --vbv-bufsize "$buf" --vbv-maxrate "$max_rate"  --preset slow   --bitrate "$rate" --scenecut 0 --no-scenecut --pass 1 --min-keyint 48 --keyint 48   --input-res 3840x1744 --video-filter "resize:width=1280,height=720" -o output_batch/sintel_hd_"$i"M.264 sintel_4k.mov 
    else
        echo "[Warning] output_batch/sintel_hd_$iM.264 File Exists"
    fi

done
