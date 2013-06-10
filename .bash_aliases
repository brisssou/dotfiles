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
#alias update='sudo apt-fast -y --force-yes update ; sudo apt-fast -y --force-yes dist-upgrade'
alias apt-get='apt-fast'
alias repload_unity="DISPLAY=:0 unity --replace"
alias repload_compiz="DISPLAY=:0 compiz --replace"
alias giver="/usr/bin/mono --runtime=v4.0 /usr/lib/giver/Giver.exe"
