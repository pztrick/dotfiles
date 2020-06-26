#!/bin/bash

for fd in $(ls ~/.files/autostart); do
    cp -fv /home/$USER/.files/autostart/$fd /home/$USER/.config/autostart/$fd
done
