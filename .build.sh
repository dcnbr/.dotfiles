#!/bin/bash

# python
apt -y install python3 python3-venv python3-pip

# git
apt -y install git

# vim
apt -y install vim

# vundle & plugins
if [ ! -d ~/.vim/bundle/vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo | /bin/vim +PluginInstall +qall
fi


