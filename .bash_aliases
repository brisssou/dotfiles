export PYTHONSTARTUP=~/.pythonrc.py

alias 7z_uber='7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias grep='grep --color=always'
alias ls='ls --color=always'
alias less='less -R'
alias h='history'
alias l='ls -CF'
alias la='ls -Al'
alias ll='ls -l'
alias dot='ls .[a-zA-Z0-9_]*'
alias ss='ps -aux'
alias update='sudo apt-get -y --force-yes update ; sudo apt-get -y --force-yes dist-upgrade'
alias repload_unity="DISPLAY=:0 unity --replace"
alias repload_compiz="DISPLAY=:0 compiz --replace"
alias be='bundle exec'
