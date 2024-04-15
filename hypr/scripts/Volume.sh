#!/bin/bash

# 이전 볼륨 값을 저장할 파일 경로
volume_file="$HOME/.previous_volume"

# 현재 오디오 상태를 확인
current_volume=$(pamixer --get-volume)
current_mute=$(pamixer --get-mute)

# 이전 볼륨 값을 읽어오기
previous_volume=$(cat $volume_file 2>/dev/null)

# mute 토글
if [ "$1" = "toggle" ]; then
	if [ "$current_mute" = "false" ]; then
		# mute 상태가 아닌 경우, mute로 변경하고 볼륨을 0으로 설정
		echo "$current_volume" >$volume_file
		pamixer -m
		pamixer --set-volume 0
	else
		# mute 상태인 경우, mute를 해제하고 이전 볼륨으로 설정
		pamixer -u
		if [ -n "$previous_volume" ]; then
			pamixer --set-volume $previous_volume
		fi
		# 이전 볼륨 파일 삭제
		rm -f $volume_file
	fi
elif [ "$1" = "up" ]; then
	# 볼륨을 증가
	new_volume=$((current_volume + 5))
	pamixer --set-volume $new_volume
elif [ "$1" = "down" ]; then
	# 볼륨을 감소
	new_volume=$((current_volume - 5))
	pamixer --set-volume $new_volume
elif ["$1" = "mic_toggle"]; then
	pamixer --default-source -t
else
	echo "Usage: $0 [toggle|up|down|mic_toggle]"
fi
