#
# ~/.bashrc
#

#export TERM=xterm-256color


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi="vim"
alias beet="~/.venv/beets/bin/beet"
alias flexget="~/.venv/flexget/bin/flexget"
alias ls="ls --color=auto"
alias l="ls -lah"
alias t="ls -larth"
alias last="last --fulltimes"
alias sudo="sudo -E "
alias pacman="pacman --color auto"
alias top="htop"
alias newt="ssh root@newt"

export SUDO_EDITOR=vim
export PATH="$HOME/.venv/powerline/bin:$HOME/.dotfiles/.bin:$HOME/.gem/ruby/2.3.0/bin:$PATH"
export EDITOR=vim
export HISTCONTROL=ignoredups
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=5000
export HISTIGNORE=
export HISTSIZE=2000
export HISTTIMEFORMAT="%a %b %Y %T %z "

complete -cf sudo
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
shopt -s checkwinsize

#if ! pgrep -u $USER ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
#    eval $(<~/.ssh-agent-thing)
#fi

# Git stuff
#source /usr/share/git/completion/git-completion.bash
bashgitprompt='$(__git_ps1)'
source /usr/share/git/completion/git-prompt.sh

if [[ ${EUID} == 0 ]] ; then
  PS1="\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
  #PS1="\[\033[38;5;220m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;252m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;70m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;69m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;129m\]\\$\[$(tput sgr0)\]"
 # PS1="\[\033[38;5;220m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;252m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;70m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;129m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
  #PS1="\[\033[38;5;3m\]\u\[$(tput sgr0)\]\[\033[38;5;248m\]@\[$(tput sgr0)\]\[\033[38;5;5m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;32m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;2m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
  export PS1="\[\033[38;5;249m\]\u\[$(tput sgr0)\]\[\033[38;5;245m\]@\[$(tput sgr0)\]\[\033[38;5;240m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]"$bashgitprompt" \[$(tput sgr0)\]\[\033[38;5;5m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
