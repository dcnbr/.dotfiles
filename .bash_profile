#!/bin/bash

# smaller tab spacing
tabs -4

# add local bin to path
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# include .bashrc
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi


