#echo bash init run
EDITOR=mcedit;		export EDITOR
LANG=en_US.UTF-8;	export LANG

alias mc='mc -x'
alias me='mcedit'
alias g='git'
alias s='svn'
alias m='nice make'
alias gm='nice gmake'
alias q='exit'
alias sc='screen -DR'
ssc() { ssh -t $* screen -DR; }
#ssc() { /usr/local/bin/ssh -z $* screen -DR || ssh -t $* screen -DR; }
ssz() { /usr/local/bin/ssh -z -t $* screen -DR; }
t() { perl -e "print scalar localtime $*"; }

#alias postcmd 'echo -ne "^[k\!#:0^[\\"'

# If runing in screen, set the window title to the command about to be executed
#preexec () { :; }
#preexec_invoke_exec () {
#preexec() {
#echo preexec
#    [ -n "$WINDOW" ] && print -Pn "^[k$2^[\\"
#if [[ "$TERM" == "screen" ]]; then
   #local CMD=${1[(wr)^(*=*|sudo|-*)]}
   #local CMD=${1}
   #echo -n "\ek$CMD\e\\"
#    printf "\033k$1\033\\"
#fi
#}
#trap 'preexec_invoke_exec' DEBUG

# If in screen, blank the window title when displaying the prompt
#premd() {
#echo precmd
#    [ -n "$WINDOW" ] && print -Pn "^[k ^[\\"
#}


#case "$TERM" in
#  screen)
#      set -o functrace
#      trap 'echo -ne "\ek\$:${BASH_COMMAND:0:20}\e\\"' DEBUG
#      export PS1='\[\033k$:\W\033\\\]\u@\h:\w\$ '
#    ;;
#  *)
#    ;;
#esac

#LC_CTYPE=ru_RU.UTF-8;   export LC_CTYPE
#LC_ALL="ru_RU.UTF-8";   export LC_ALL
#LANG=ru_RU.UTF-8;       export LANG

#echo bash inited
#sleep 1
