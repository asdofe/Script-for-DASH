#!/bin/bash
readarray batch_file < <(ls -tr output_batch)

echo "The following file is waiting to be processed "
echo "${batch_file[*]}"
for fn in "${batch_file[@]}"
do
    if [[ $fn =~ sintel_([0-9a-zA-Z]+)_([0-9]+)M\.264 ]]
    then 
        
        echo "Processing ${BASH_REMATCH[0]}"
        res="${BASH_REMATCH[1]}"
        br="${BASH_REMATCH[2]}"
        dst=output_batch/"$res"/"$br"
        if [[ ! -e $dst ]]
        then
            mkdir -p "$dst/seg"
            output_file="$dst"/"$br"M_"$res"_sintel_output.mp4
            MP4Box -add output_batch/"${BASH_REMATCH[0]}" -fps 24 "$output_file" 
            MP4Box -dash 2000 -frag 2000 -rap -out "$dst"/stream.mpd -segment-name seg_ "$output_file" 
        else
            echo "$dst" has already exists
        fi
    fi
    
done
