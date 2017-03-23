#!/bin/sh
# -y forces avconv to overwrite any file
# -r 10 creates a clip with 10 frames per seconds (for some versions of avconv you have to specify it twice)
# -i specifies the input file(s). %4d means any 4 decimal numbers
# -vcodec specifies the video codec to be used (H.264 in this case)
# -q:v specifies the quality, value ranges from 1 (best) to 31 (worse)
# -crf option tells avconv to aim for a quality level of “20” which is a good starting point. Lowers values are better but will increase the file size.
# crop= specifies which area of the images will be cropped
# -vf = video filter
# scale= indicates how much scaling must take place (in the above example iw:ih indicates that the output width and height will be that of the in width and in height)
# the last parameter is the output file
#

cd time-lapse
avconv -r 10 -i new-timelapse%04d.jpeg -r 10 -vcodec libx264 -crf 20 -g 15 -vf scale=iw:ih ../timelapse.mp4

echo "Done!"
