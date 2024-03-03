#!/bin/bash

source bin/join_images_in_folder.shl
source bin/join_videos_nosound.shl
source bin/add_music_to_video.shl
source bin/audio_fadein.shl
source bin/audio_fadeout.shl
source bin/audio_adjust_video_length.shl
source bin/rotate_video.shl
source bin/corp_video.shl

wrk_dir="Dokumenty/basnici\ dekadence"
wrk_dir="${HOME}/${wrk_dir}"
eval wrk_dir="${wrk_dir}"
myhome="${PWD}"

declare -a renderVideo

oriskymp4="${wrk_dir}/orisky"
join_images_in_folder "${oriskymp4}/out/out*.jpg" "${myhome}/orisky_raw.mp4" "5" "10"
rotate_video "${myhome}/orisky_raw.mp4" "${myhome}/orisky_rotated.mp4" "0"
corp_video "${PWD}/orisky_rotated.mp4" "${PWD}/orisky.mp4" "3024" "4032"
renderVideo+=("${myhome}/orisky.mp4")

video01="${wrk_dir}/Dno/01"
join_images_in_folder "${video01}/*.jpg" "${PWD}/video01.mp4" "5" "10"
renderVideo+=("${PWD}/video01.mp4")

video02="${wrk_dir}/Dno/02"
join_images_in_folder "${video02}/*.jpg" "${PWD}/video02.mp4" "10" "10"
renderVideo+=("${PWD}/video02.mp4")

video03="${wrk_dir}/Dno/03-cuts"
join_images_in_folder "${video03}/*.jpg" "${PWD}/video03.mp4" "5" "10"
renderVideo+=("${PWD}/video03.mp4")

video04="${wrk_dir}/Dno/04"
join_images_in_folder "${video04}/*.jpg" "${PWD}/video04.mp4" "15" "10"
renderVideo+=("${PWD}/video04.mp4")

echo "***************************necoo"
video05="${wrk_dir}/Dno/outro"
join_images_in_folder "${video05}/*.jpg" "${PWD}/video05.mp4" "1" "10"
rotate_video "${PWD}/video05.mp4" "${PWD}/video05_crop.mp4" "1"
ffmpeg -loglevel fatal -y -i "${PWD}/video05_crop.mp4" -vf "hflip" "${PWD}/video05_flip.mp4"
renderVideo+=("${PWD}/video05_flip.mp4")
renderVideo+=("${PWD}/video05_flip.mp4")

rm -rf "${renderedvideo_nosound}"
renderedvideo_nosound="${PWD}/vystup.mp4"
join_videos_nosound "${renderedvideo_nosound}" "${renderVideo[@]}"

audiotrack_raw="${wrk_dir}/Dno/stopa.mp3"
eval audiotrack_raw="${audiotrack_raw}"
audio_fadein "${audiotrack_raw}" "${PWD}/audiotrack.mp3" "3"
audio_adjust_video_length "${PWD}/audiotrack.mp3" "${PWD}/audiotrack1.mp3" "${renderedvideo_nosound}"
audio_fadeout "${PWD}/audiotrack1.mp3" "${PWD}/audiotrack2.mp3" "3"
audiotrack="${PWD}/audiotrack2.mp3"

renderedvideoWithMusic="${PWD}/vystup_audiox4.mp4"
add_music_to_video "${renderedvideo_nosound}" "${audiotrack}" "${renderedvideoWithMusic}"
