# Set up the prompt

source /home/luci/Repos/Programs/antigen.zsh

export EDITOR='nvim'
export _ANTIGEN_CACHE_ENABLED="false"


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

###########
# antigen
###########

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme.
antigen theme bira

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle tmux
antigen bundle thefuck
antigen bundle docker-compose
antigen bundle docker-machine
antigen bundle docker
antigen bundle rust
antigen bundle yarn
antigen bundle ssh-agent
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions


# Tell Antigen that you're done.
antigen apply
###################

##########
# exports
##########

export TERM="xterm-256color"

##########
# aliases
##########

alias sch="sudo chmod 755 "
alias tmux="TERM=xterm-256color tmux"
# copy to clip board
alias copy="xclip -selection clipboard "
alias rm="rm -rf"
alias sn="sudo nvim"
alias sdd="ddgr --num 5 "
alias dya="youtube-dl --prefer-ffmpeg --audio-format mp3 -x "
alias dyv="youtube-dl --audio-format mp3 "
alias ct="rm *.*~"

###################


##############
# functions 
##############
[[ -e ~/luxi_shell/functions ]] && source ~/luxi_shell/functions

# required mkd 
function lnote() {
  time=`date '+%H:%M:%S'`
  n_directory=~/Documents/luxi_note
  name_file=`date '+%Y-%m-%d'`
  path_to_file="$n_directory/$name_file"
  mkdir -p $n_directory
  echo "$time $*" >> "$path_to_file"
}
###################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:$HOME.yarn/bin/yarn"
export PATH="$(yarn bin >> /dev/null 2>&1):$PATH"
