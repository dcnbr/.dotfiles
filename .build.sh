#!/bin/bash

# python & essentials
if  ! command -v python3 ; then
	apt -y install python3
fi
apt -y install python3-venv python3-pip

# vundle & plugins
if [ ! -d ~/.vim/bundle/vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo | /bin/vim +PluginInstall +qall
fi


