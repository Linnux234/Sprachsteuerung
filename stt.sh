#!/bin/bash

echo “Recording…”
arecord -d 5 -f dat -t wav | ffmpeg -y -i - -ar 16000 -acodec flac file.flac

echo “Processing…”

wget -q --post-file file.flac --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v2/recognize?client=chromium&lang=de-DE&key=[Dein Key]" | cut -d: -f6 | cut -c 2- | rev| cut -c 17- | rev > stt.txt

echo -n “You Said: ”
cat stt.txt

#rm file.flac > /dev/null 2>&1

