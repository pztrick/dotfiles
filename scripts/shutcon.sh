#!/bin/bash
set -e

if [ "$(nproc)" -ge "4" ]; then
	# 4 or more CPU cores, ergo we shut down
	/usr/bin/sudo /sbin/shutdown -P now
fi
