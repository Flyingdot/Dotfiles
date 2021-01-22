#!/bin/sh

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# todo create vim/nvim configuration
#  - aliases
#  - symlink for configuration

# setup vim
nvim +PlugInstall +qall

