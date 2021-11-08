# Source zsh plugins, requires installing antibody
# curl -sfL git.io/antibody | sh -s - -b /usr/local/bin, brew install antibody or AUR
source <(antibody init)

autoload -Uz compinit
compinit

# Put your plugins in .zsh_plugins.txt and let antibody source it
#antibody bundle < ~/.zsh_plugins.txt
antibody bundle romkatv/powerlevel10k
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
# Requires fzf to be installed and symlinking ~/.fzf -> /opt/homebrew/var/homebrew/linked/fzf on MacOS,
# or ~/.fzf/shell to /usr/share/fzf on linux
antibody bundle unixorn/fzf-zsh-plugin
antibody bundle Aloxaf/fzf-tab

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias vi="vim"
alias pacman="pacman --color auto"
alias grep='grep --color=auto'
alias rsync='rsync --info=progress2'
alias top="htop"
alias weather='curl v2.wttr.in'

case "$OSTYPE" in
  darwin*)
    alias ls="ls -G"
  ;;
  linux*)
    alias pkill='pkill -i -e'
    alias pgrep='pgrep -i'
    alias ip="ip -c"
    alias ls="ls --color=auto --quoting-style=literal"
  ;;
esac

# Modules
# Allows for e.g ztcp example.com 80
zmodload zsh/net/tcp

# Cache zsh completion results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Base16 Shell
# Requires git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
