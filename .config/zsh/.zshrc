precmd () { print -Pn "\e]0;`pwd`\a" }
preexec () { print -Pn "\e]0;$1\a" }

RPROMPT=""

#Correcting backspace problems
export TERM=linux

# History
HISTSIZE=40000
SAVEHIST=40000
HISTFILE=~/.cache/zsh/history
setopt appendhistory autocd extendedglob nonomatch notify hist_ignore_all_dups hist_ignore_space clobber COMPLETE_ALIASES

unsetopt beep
bindkey -e

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches found%b'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


fpath=(~/.config/zsh/functions $fpath)

autoload -U colors && colors
# autoload -U promptinit
# promptinit
# prompt adam2

# Completion
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# vim mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'c' vi-backward-char
bindkey -M menuselect 't' vi-up-line-or-history
bindkey -M menuselect 's' vi-forward-char
bindkey -M menuselect 'r' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^f' edit-command-line

autoload -U up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search; zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '^R' history-incremental-search-backward

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set title to GNU screen/byobu tab
settitle() {
    if [ "$TERM" = "screen" ];
    then
        printf "\033k$1\033\\";
    fi
}

# Set title when sshing within a tab to some host
ssh() {
    host=$(echo "$*" | sed "s/^.\+@\([^ ]\+\)[ \n]*.*/\1/")
    settitle $host
    command ssh "$@"
    settitle $(hostname)
}

ncmpcppShow() {
  ncmpcpp <$TTY
  zle redisplay
}
zle -N ncmpcppShow
bindkey '^[\' ncmpcppShow

cdUndoKey() {
  popd
  zle reset-prompt
}

cdParentKey() {
  pushd ..
  zle reset-prompt
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^H' my-backward-delete-word

copy-to-clip() {
    zle kill-buffer
    print -rn -- $CUTBUFFER | wl-copy
}; zle -N copy-to-clip
bindkey -M viins "^p" copy-to-clip

clear-screen() { clear; zle redisplay; }
zle -N clear-screen

source ~/.aliases

if [ -r ~/.aliases.local ]; then
    source ~/.aliases.local
fi

if [ -r $ZDOTDIR/.zshrc.local ]; then
    source $ZDOTDIR/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=($ZDOTDIR/pure)
autoload -U promptinit; promptinit
prompt pure

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null

