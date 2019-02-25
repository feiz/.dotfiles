#vim:fileencoding=utf-8
#general

# C-sによる画面出力停止を無効にする
stty stop undef

export TERM=xterm-256color

# set PATH so it includes user's private bin if it exists
[ -f "$HOME/.zshpathes" ] && source $HOME/.zshpathes
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin
eval "$(direnv hook zsh)"

#editor
export EDITOR=vim

#temporaly out file
export feiz=/tmp/feiz.out

#language
export LANG="ja_JP.utf-8"
export LC_ALL="ja_JP.utf-8"
export HGENCODING="UTF-8"

# dircolors setting
if [ `uname` = "Darwin" ];then
    export LSCOLORS=gxfxcxdxbxegedabagacad
else
    eval `dircolors -b $HOME/.dir_colors`
fi

case $OSTYPE in
    freebsd*|darwin*)
        alias ls="ls -FG"
        ;;
    linux*)
        alias ls="ls -F --color=always"
        ;;
esac

#alias
setopt complete_aliases
alias ll="ls -lAh"
alias grep="egrep"
alias findpy='find . -name "*.py" | xargs grep '
alias findhtml='find . -name "*.html" | xargs grep '
alias du="du -h"
alias df="df -h"
alias tree="tree --charset=C"
alias sudosu="sudo -E su -m"
alias sudovim="vim sudo:"
alias dk='docker'
alias dkm='docker-machine'
alias dks='docker-swarm'
alias dkc='docker-compose'
alias dkc='docker-compose -f docker-compose-local.yml'
export LESS="FSRX"

#prompt
P_UNAME="%n"
P_DELM="%%"
P_HOST="%M"
P_DIR="%2~"

autoload -Uz vcs_info
zstyle ":vcs_info:*" formats "%s[%b]"
zstyle ":vcs_info:*" actionformats "%s[%b|%a]"

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


#color for usertype
case ${UID} in
#root
    0)
        P_UNAME="%B%{[31m%}$P_UNAME%{[m%}%b"
        P_DELM="%B%{[31m%}$P_DELM%{[m%}%b"
        ;;
#not root
    *)
        P_UNAME="%{[36m%}$P_UNAME%{[m%}"
        P_DELM="%{[36m%}$P_DELM%{[m%}"
        ;;
esac 

#color for hoststate
#[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
P_HOST="%B%{[32m%}$P_HOST%{[m%}%b"

#color for correct
SPROMPT="もしかして: %{[33m%}%r%{[m%} [nyae]:"

#color for vcsstat
P_VCS="%1(v|%{[33m%}%1v%{[m%}|)"

PROMPT="$P_UNAME@$P_HOST $P_DELM "
RPROMPT="$P_VCS $P_DIR"
PROMPT2="$P_UNAME %_$P_DELM "

#mysql prompt
MP_USER="[33m\u[00m"
MP_HOST="[32m\h[00m"
MP_DB="[[31m\d[00m]"
MP_DELM="[33m>[00m"
#export MYSQL_PS1="$MP_USER@$MP_HOST $MP_DB $MP_DELM "

#vi keybind
bindkey -e

#history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/feiz/.zshrc'
zstyle ':completion:*' list-colors ''

setopt no_beep

#autocomplete
autoload -Uz compinit
compinit
setopt auto_cd auto_pushd correct list_packed noautoremoveslash



# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/feiz/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/feiz/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/feiz/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/feiz/google-cloud-sdk/completion.zsh.inc'
fi
