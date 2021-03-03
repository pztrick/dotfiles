#!/bin/bash

curl -fsSL https://starship.rs/install.sh | bash

mkdir -p ~/.config
ln -sf ~/.files/starship.toml ~/.config/starship.toml
