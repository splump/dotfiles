alias makecsv='for f in $(ls | grep -E "(Stores|MacAddresses).*\.xlsx"); do mv -v ${f%.*}.csv ${f%.*}.csv.old; ssconvert $f ${f%.*}.csv 2> /dev/null; echo; echo "Diff output:"; diff -B -y --suppress-common-lines ${f%.*}.csv ${f%.*}.csv.old && echo "- No diff"; echo; done'
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
alias remmina='rm -f $HOME/.config/freerdp/known_hosts2 && remmina'
