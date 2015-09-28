# $FreeBSD: release/9.0.0/share/skel/dot.profile 199243 2009-11-13 05:54:55Z ed $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=mcedit;   	export EDITOR
PAGER=more;  	export PAGER
LC_CTYPE=ru_RU.UTF-8; export LC_CTYPE

# set ENV to a file invoked each time sh is started for interactive use.
#ENV=$HOME/.shrc; export ENV

#if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi


if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
