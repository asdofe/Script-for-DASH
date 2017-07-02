# Purpose

## Scripts for Generate MPEG-DASH including MPD file 

* bad format -> raw 264 -> mpeg-dash including single MPD file

---

## Prerequisites

### My Env

*  4.4.0-75-generic #96~14.04.1-Ubuntu SMP Thu Apr 20 11:06:30 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux


### Executable Binary 

* x264(The binary is in the repo)

* MP4Box

### Video Source

* My Video Source is called sintel_4k.mov 

---

### Directory Layout

Folder assets is for the home of final unique MPD file and MP4 segments.

Folder output_batch is for convert the wrong format into the .264 file. Sorry that I forgot to arrange output neatly for .264 files. 

Folder output_batch/2k, fhd, hd is the destination for output of mp4. This is the file we truly want. 

### Execution Order 

1. 2k_conv_batch.sh/fhd_conv_batch.sh/hd_conv_batch.sh/

    for files format conversion

2. mp4box_batch.sh
    
    for add some attributes to the files

3. gen_single_mpd.sh 
    
    for split mp4 and generate mpd file
