#!/bin/bash 

[ -f /bin/git ] && printf "%s\n" "git found running...." || exit 1 

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
