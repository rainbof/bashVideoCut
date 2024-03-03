About
------
goal of this project is create set of basic and simple scripts to maniplulate with images/videos/audio

requirments:
------------
* ffmpeg
* bash 5.1+

Whats new in 1.0a?
------------------
* basic functionality 
* added documentation

Added functions
---------------
* join images together into 1 video with defined fps
* glue videos together into one
* add music background
* split

## Implemented functions
for parameters, see source or official wiki [[https://github.com/rainbof/bashVideoCut/wiki/Functions]]
### Video cutting functions:
corp_video.shl
join_videos.shl
join_images_in_folder.shl
rotate_video.shl

### Video info functions
ff_get_height.shl
ff_get_width.shl
ff_get_duration.shl

### Music functions
add_music_to_video.shl
audio_fadeout.shl
audio_fadein.shl
audio_copy_part.shl
audio_adjust_video_length.shl
