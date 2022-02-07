#!/bin/bash
# aliases to _commands are implemented further below

# aliases
alias py='python3'
alias catjs='python3 -m json.tool'
alias lsv='ls -alvh'
alias anywhere='grep -rn . -e'
alias where='_where'
alias rmrf='_rmrf'
alias cl='_cl'

# default parameter additions
alias vim='vim -c Goyo'
alias rm='rm -I'
alias git='_git'

# dotfile edit shortcuts
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias aliases='vim ~/.bash_aliases'
alias profile='vim ~/.bash_profile'
alias gitconfig='vim ~/.gitconfig'

# .dotfiles git alias
# credit StreakyCobra and Nicola Paolucci
# https://www.atlassian.com/git/tutorials/dotfiles
# https://news.ycombinator.com/item?id=11071754
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'


# implementations of _aliases
_cl() {  # cd-then-ls
    dir="$*";
    if [ $# -lt 1 ]; then
		dir=$HOME;
    fi;
    builtin cd "${dir}" && ls --color=auto

}

_where() {  # where in a file is "$@" in this directory ? show me
	grep -n --exclude-dir=* -e $@ *
}

_rmrf() {  # 'rm -rf $@' but it asks nicely first
	num=$(du -cha $@ | wc -l)
	size=$(du -chs $@ | sed -n -e 's/\(^[[:alnum:].]*\).*total/\1/p' )
	(( $num >= 1 )) && s="ies" || s="y"
	echo "$((${num}-1)) entit${s} (${size}) will be force removed with ${@}."
	read -p "Continue? " c && [[ $c == [yY] || $c == [yY][eE][sS] ]] || exit 1
	rm -rf $@
}

_git() {  # pretty git (references custom formats from .gitconfig)
	if [[ $1 == "log" ]]; then
		/bin/git log --graph --abbrev-commit --decorate --format=synopsis ${@:2}
	else
		/bin/git "$@"
	fi
}


