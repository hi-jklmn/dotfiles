#!/bin/bash
TASK=${1:-Pomodoro}
termdown 20m -T $TASK
espeak "${TASK:-Pomodoro} done" 2> /dev/null; noti -t "${TASK:-Pomodoro} done"
