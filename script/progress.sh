#!/bin/bash
DEFAULT_STR="请稍候..."
STR_FILE="/tmp/progress_str"
START_FILE="/tmp/progress_start"
END_FILE="/tmp/progress_end"

function show_dynamic_progress() {
	local delay=0.1
	local spinstr='|/-\|/-\'
	while [ -f "$START_FILE" ]; do
		local temp=${spinstr#?}
		printf " [%c] [%s] " "$spinstr" "$(cat "$STR_FILE")"
		local spinstr=$temp${spinstr%"$temp"}
		sleep $delay
		printf "\r%s\r" "$(printf ' %.0s' {1..80})"
	done
}


function set_progress_str() {
	str="$1"
	echo "$str" > "$STR_FILE"
}

function progress_start() {
	if [ "$1" != "" ]; then
		echo "$1" > "$STR_FILE"
		echo "$1" > "$END_FILE"
	else
		echo "$DEFAULT_STR" > "$STR_FILE"
	fi
	echo "$!" > "$START_FILE"
	show_dynamic_progress &
}

function progress_done() {
	rm -f "$START_FILE"
	sleep 0.5
	printf "\r%s\r" "$(printf ' %.0s' {1..80})"
	printf " [OK] [%s] [done] \n" "$(cat "$END_FILE")"
}

function progress_done_one() {
	if [ "$1" != "" ]; then
		echo "$1" > "$STR_FILE"
	fi
	printf "\r%s\r" "$(printf ' %.0s' {1..80})"
	printf " [OK] [%s] [done] \n" "$(cat "$STR_FILE")"
}

function progress_suspend() {
	rm -f "$START_FILE"
}

function progress_resume() {
	echo "$!" > "$START_FILE"
}


export -f progress_start
export -f progress_done
export -f progress_done_one
export -f progress_suspend
export -f progress_resume
export -f set_progress_str
