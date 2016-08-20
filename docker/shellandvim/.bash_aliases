# display files in a tree
alias dtree='find . -type d -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g" | less'
alias ftree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g" | less'

alias g='LC_ALL=en_US.UTF-8 gvim'

# GIT COMMANDS

# generate a tree of commits in a git repository
alias gla='git log --decorate --oneline --color --graph --all'
alias gl='git log --decorate --oneline --color --graph'

# generate a tree of all the branches in a git repository
alias glb='git log --graph --simplify-by-decoration --color --pretty=format:"%d" --all'

alias ga='git add'
alias gau='git add -u'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gc='git checkout'
alias gs='git status --short'
alias gb='git branch'
alias gf='git fetch'
alias gp='git remote prune origin'
alias gd='git diff'

alias gpl='git status --short | xargs pylint | less'

# SHELL COMMANDS

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'
alias lla='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cls='clear;ls -l'
alias grep='grep --colour=always'
alias cp='cp -i' # do not override existing files
alias projmake='/home/slee601/projmake/bin/projmake'
