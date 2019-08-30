alias vi="vim"
alias ip="ip -c"
alias l="ls -lah"
alias t="ls -larth"
alias sudo="sudo -E "
alias pacman="pacman --color auto"
alias top="htop"
alias remmina='rm -f $HOME/.config/freerdp/known_hosts2 && remmina'
alias mount-hive='sshfs bishop:/hive /hive/ -o user,idmap=user,follow_symlinks,allow_other'
alias weather='curl v2.wttr.in'

if [[ "$OSTYPE" == "Linux" ]]; then
  alias ls="ls --color=auto --quoting-style=literal"
elif [[ "$OSTYPE" == "Darwin" ]]; then
  alias ls="ls -G"
fi

