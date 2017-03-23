#!/bin/bash
# To find fonts on system:
# $ identify -list font
#
# Imagemagick - see http://www.imagemagick.org/Usage/annotating/
#                   http://www.imagemagick.org/script/command-line-options.php

FOLDER_IN=time-lapse
FOLDER_OUT=time-lapse
FONT_SIZE=28
FONT_COLOR=white
FONT=ComicSans

cd $FOLDER_IN

echo "cleaning up...."
rm -rf new*

echo "processing files....."
for file in *.jpeg ; do
   convert "$file" \
   -background white \
   -stroke  none \
   -fill white \
   -gravity southeast -annotate 0  %[exif:DateTimeOriginal] \
   -gravity southwest -annotate 0  $file \
   "new-${file}"
done

echo "Done!"
