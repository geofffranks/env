# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export GIT_MERGE_AUTOEDIT=0

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Aliases
alias ls='ls --color=auto'
alias more=less
alias vi="vim"
alias less="less -R"
alias vim="nvim -X -O"
alias grpe='grep'
alias grep='grep --color'
alias gl="git log -n 20 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %an' --abbrev-commit --date=relative"
alias gs="git status"


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Environ Variables
export EDITOR=nvim
export CLICOLOR=true
# use http://geoff.greer.fm/lscolors/ to generate both of these
export LSCOLORS="exgxfxdxcxdxdxabagacad"
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=33:cd=33:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PAGER="less -R"
export RI="-f ansi"

PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
PERL5LIB="$HOME/perl5/lib/perl5"; export PERL5LIB;
export PATH="$PATH:$HOME/perl5/bin"

export PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}"

. `brew --prefix`/etc/profile.d/z.sh

# git prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  source $HOME/.bash-git-prompt/gitprompt.sh
  export GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
  export GIT_PROMPT_ONLY_IN_REPO=0
  export GIT_PROMPT_THEME="Custom"
fi

eval "$(go env)"

export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/node@20/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@20/lib"
export CPPFLAGS="-I/usr/local/opt/node@20/include"


eval "$(rbenv init - bash)"

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi
