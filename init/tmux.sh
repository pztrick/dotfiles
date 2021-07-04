#!/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

pip install powerline-gitstatus powerline-docker powerline-aws

ln -sf ~/.files/tmux.conf ~/.tmux.conf
ln -sf ~/.files/powerline ~/.config/powerline
