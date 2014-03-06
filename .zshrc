# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem svn)

source $ZSH/oh-my-zsh.sh


# zsh configuration
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:cd::' tag-order '! users' -
zstyle ':completion:*' use-cache on
zstyle ':completion:*' hosts off
setopt NO_AUTO_MENU
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias rake='noglob rake'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Configure history
#export HISTFILE=/dev/null
export SAVEHIST=0

# Colors for ls
export CLICOLOR=1
export LSCOLORS=Axfxcxdxbxegedabagacad
# Colors for httpie and probably others
export TERM=xterm-256color

# aliases
alias mv='mv -i'
alias ls='ls -Fp'
# HTTPie. Other favorite styles include "friendly" and "perldoc"
alias http='http -s manni'
alias irb='irb -I lib'

function chpwd() {
    emulate -L zsh
    if [ -f ".envfile" ]; then
        source .envfile
    fi
}

__git_files () { 
    _wanted files expl 'local files' _files     
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
