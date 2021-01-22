#!/bin/sh

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# todo create vim/nvim configuration
#  - aliases
#  - symlink for configuration

# setup vim
nvim +PlugInstall +qall
