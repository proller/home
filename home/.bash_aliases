#echo bash init run
export EDITOR=mcedit
export LANG=en_US.UTF-8
export PATH="$PATH:/usr/local/bin:$HOME/bin"

distccj=$(distcc -j 2> /dev/null)
[ -z $distccj ] && distccj=false
(("$distccj" >= "1")) && export CCACHE_PREFIX=distcc
[ -n "$CCACHE_PREFIX" ] && CCP=CCACHE_PREFIX=distcc
export DISTCC_TCP_CORK=0

nice="nice -n20"
screen_opt="-a -h 100000 -U"

alias bx="bash -x"
alias mc="mc -x"
alias me="mcedit"
alias g="git"
alias s="svn"
alias m="$nice make"
alias gm="$nice gmake"
alias mj="time env $CCP $nice make -j $(nproc || sysctl -n hw.ncpu || echo 2)"
alias mjv="mj V=1 VERBOSE=1"
alias ml="time env $CCP $nice make -j -l $(nproc || sysctl -n hw.ncpu || echo 2)"
alias ml2="time env $CCP $nice make -j -l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"
alias mjd="time env $CCP $nice make -j `( [ -n $distccj ] && echo $distccj ) || nproc || sysctl -n hw.ncpu || echo 4` -l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"
alias mjdz="time env $CCP $nice make -j $((`( [ -n $distccj ] && echo $distccj ) || echo 2`)) -l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"
alias n="$nice ninja -l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"
alias nj="$nice ninja -j `( [ -n $distccj ] && echo $distccj ) || nproc || sysctl -n hw.ncpu || echo 4` -l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"

alias q='exit'
alias sc='screen -DR'
alias tm='tmux $tmux_opt new-session -A -s 0'
alias tf='tail -F'
alias jf='json_xs <'
#alias dut='du | sort -rn | head -n 20'
dut() { du --one-file-system $* | sort -rn | head -n 20; }
ssc() { /usr/local/bin/ssh -A -t $* screen $screen_opt -DR || ssh -A -t $* screen $screen_opt -DR || ssh -A $*; }
sst() { /usr/local/bin/ssh -A -t $* tmux $tmux_opt new-session -A -s 0 || ssh -A -t $* tmux $tmux_opt new-session -A -s 0 || ssh -A $*; }
ssr() { set -x; for i in {1..10}; do ssh -A -t $* tmux $tmux_opt new-session -A -s 0 || ssh -A $*; sleep $i; done; }
ssz() { /usr/local/bin/ssh -A -o "UserKnownHostsFile ~/.ssh/known_hosts_sctp" -z -t $* screen $screen_opt -DR; }
ssv() { ssh -A -t $* "apt update && sleep 1 && apt install -y screen mc dstat && screen $screen_opt -DR"; }
t() { perl -E "say map {scalar localtime \$_, qq{\n}} qw( $* )"; }
p() { perl -E "say q{}, sub{ $* }->()"; }
kd() { KDevelop.AppImage $* > /dev/null 2>&1 < /dev/null & }
cf() { cmd=`bash -c "compgen -c clang-format | grep 'clang-format-[[:digit:]]' | sort --version-sort --reverse | head -n1"`; $cmd -i $*; }
cmcc() { cmake -DCMAKE_C_COMPILER_LAUNCHER=`which ccache` -DCMAKE_CXX_COMPILER_LAUNCHER=`which ccache` $*; }


export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


ssh_auth="${HOME}/.ssh/ssh_auth_sock"
if [ -n "${SSH_AUTH_SOCK}" -a "${SSH_AUTH_SOCK}" != "${ssh_auth}" -a -e "${SSH_AUTH_SOCK}" ]; then
    ln -sf "${SSH_AUTH_SOCK}" "${ssh_auth}.$$" ||:
    chmod go-rwx "${ssh_auth}.$$" ||:
    ln -sf "${ssh_auth}.$$" "${ssh_auth}" ||:
    export SSH_AUTH_SOCK="${ssh_auth}"
fi


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

#echo bash inited
#sleep 1
