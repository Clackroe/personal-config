#!/usr/bin/env bash
# Undo node
npm uninstall -g yarn typescript-language-server typescript
sudo apt purge nodejs npm
rm /usr/local/lib/node_modules/n/bin/n
rm /usr/local/bin/n
rm /usr/local/bin/node

# Undo zsh
uninstall_oh_my_zsh
chsh /bin/bash
sudo apt purge zsh

# Undo Core Install
sudo apt -y purge curl htop stow tmux build-essential wireshark golang fzf lsof kdenlive i3 ccache ninja-build yarn python3-pip xclip dconf-editor nvidia-settings brave-pavucontrol clangd lua tldr
