#!/bin/bash
idletime=$((2*60*60*1000)) # ms
idle=0

while [ $idle -lt $idletime ];do
    idle=`xprintidle`
    sleep 1
done
shutdown -P now

