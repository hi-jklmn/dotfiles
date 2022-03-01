#!/bin/bash
termdown $1
shift
espeak "$*" 2> /dev/null; noti -t "$*"
