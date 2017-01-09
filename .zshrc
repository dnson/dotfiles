# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump vi-mode web-search vim-interaction vundle tmux rake docker ruby rails golang)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.bash_profile
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
compctl -g '~/.teamocil/*(:t:r)' teamocil

bindkey '^[f' vi-forward-word
bindkey '^[b' backward-word
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^k' forward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias m=make

export PATH=$PATH:/usr/local/go/bin

#review the old command
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^f' peco-select-history
###

#twc_gulp_rtl

function gulp_rtl() {
  gulp css-theme 
  gulp css-module
  gulp  css-shared
}
####

#twc_init_module
function init_module() {
  rm translations/*
  module_name=`basename "$PWD"`
  echo "# Translation of $module_name module (7.x-3.12)
  #
  msgid \"\"
msgstr \"\"
\"Project-Id-Version: shared:$module_name (7.x-3.12)\\\n\"
\"POT-Creation-Date: 2015-05-01 07:45+0000\\\n\"
\"PO-Revision-Date: YYYY-mm-DD HH:MM+ZZZZ\\\n\"
\"Language-Team: Jason Smith\n\"
\"MIME-Version: 1.0\n\"
\"Content-Type: text/plain; charset=utf-8\\\n\"
\"Content-Transfer-Encoding: 8bit\n\"
\"Plural-Forms: nplurals=2; plural=n != 1;\\\n\"

#header" > "translations/$module_name.en-US.po"

  rm gemfile
  rm guardfile
  rm config.rb
  ln -s ../../lib/ruby/Gemfile Gemfile
  ln -s ../../lib/ruby/Guardfile Guardfile
  ln -s ../../lib/ruby/config.rb config.rb
}
###