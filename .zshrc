# .zshrc
# rmsare

# Use Oh My Zsh
export ZSH="/home/rmsare/.oh-my-zsh"
ZSH_THEME="minimal"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# aliases!
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls -lh --color=auto'
alias matlab='matlab -nodesktop -nosplash'
alias clj='java -cp /opt/clojure-1.8.0/clojure-1.8.0.jar clojure.main'
alias pyton='python3'
alias ipython='ipython --pylab --term-title --pprint'

# remote hosts
alias m='ssh rmsare@myth.stanford.edu'
alias c='ssh rmsare@cees-tool-5.stanford.edu'

# set up path and ld path
export PATH="$PATH:/opt/gmt5/bin/:/usr/local/GMT5SAR/bin/:/home/rmsare/software/LAStools/bin/:/usr/lib/gmt/bin:/usr/local/texlive/2014/bin/i386-linux/:/home/rmsare/scripts/"
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# activate anaconda
. "/home/rmsare/miniconda3/etc/profile.d/conda.sh"
export PATH="/home/rmsare/miniconda3/bin:$PATH"
