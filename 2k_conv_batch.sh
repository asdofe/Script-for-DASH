#!/bin/bash

batch_config=(40 39 38 37 36 35 34 33 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13)
for i in ${batch_config[@]}
do
    let "rate=$i*1000"
    echo "bitrate:$rate"
    let "max_rate=$rate*2"
    let "buf=$max_rate*2"
    if [[ ! -e output_batch/sintel_2k_"$i"M.264 ]]
    then
        ./x264bin --fps 24 --vbv-bufsize "$buf" --vbv-maxrate "$max_rate"  --preset slow   --bitrate "$rate" --scenecut 0 --no-scenecut --pass 1 --min-keyint 48 --keyint 48   --input-res 3840x1744 --video-filter "resize:width=2560,height=1440" -o output_batch/sintel_2k_"$i"M.264 sintel_4k.mov
    else
        echo "[Warning] output_batch/sintel_2k_$iM.264 File Exists"
    fi    
done
