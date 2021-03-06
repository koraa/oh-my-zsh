export ZSH="$(dirname "$0")"

ZSH_THEME="grayabell"
plugins=(cabal git git-flow gnu-utils gpg-agent
  history-substring-search mercurial mosh nmap npm nvm
  pip rsync safe-paste singlechar sudo python
  coffee)

# Singlechar Plugin
GREP="ag"
WGET="aria2c"
PAGER_COMP="-default-"
WGET_COMP="-default-"

. "$(dirname "$0")/oh-my-zsh.sh"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

######

#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ”
#zstyle ':completion:*' completer _expand _complete _ignored _correct
#zstyle ':completion:*' use-compctl true
#zstyle ':completion:*' verbose true
#setopt appendhistory autocd extendedglob nomatch notify aliases prompt_cr prompt_sp emacs complete_aliases
#bindkey -e

zstyle ':completion:*' completer _expand _complete _ignored _correct


autoload -Uz compinit
compinit -i

autoload -Uz bashcompinit
bashcompinit -i

#source /usr/share/bash-completion/completions/aria2c
source /usr/share/bash-completion/completions/calibre
source /usr/share/bash-completion/completions/chcpu
source /usr/share/bash-completion/completions/fsck

mkdir -p ~/usr/share/zsh/
HISTFILE=~/usr/share/zsh/history
HISTSIZE=3000000
SAVEHIST=9999999999999999

######

alias rt="sudo sh -c \"HOME='$HOME' /bin/zsh\""
alias ldco='. ~/.zshrc'
alias ls="ls -Fh --color=always"
alias mkdir="mkdir -p"

######

export MANPAGER="most -C"
export MOST_SWITCHES="-s"

export EDITOR="nvim"
export PAGER="most"

export PATH=".:${HOME}/usr/sbin:${HOME}/usr/bin:${HOME}/usr/games:${PATH}"
export MANPATH="${HOME}/usr/share/man:${MANPATH}"
export CPPFLAGS="${CPPFLAGS} -I${HOME}/usr/include"
export LDFLAGS="${LDFLAGS} -L${HOME}/usr/lib"
export LD_LIBRARY_PATH="${HOME}/usr/lib:${LD_LIBRARY_PATH}"
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

export FZF_DEFAULT_COMMAND="ag --ignore node_modules --ignore .git -l"


setopt complete_aliases
unsetopt beep
compdef y=ag
compdef n=ag
#compdef d=aria2c
compdef u=curl
compdef x=xargs
compdef s=sudo

alias sc="sudo systemctl"
alias scstart="sudo systemctl start"
alias scstat="systemctl status"
alias scstop="sudo systemctl stop"
alias scre="sudo systemctl restart"
compdef sc=systemctl
