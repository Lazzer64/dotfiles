#!/bin/bash

# Get directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Soft link files
ln -sfv "$DIR/.vim" ~
ln -sfv "$DIR/.vimrc" ~

# Clone Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
