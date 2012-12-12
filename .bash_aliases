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
alias update='sudo apt-fast -y --force-yes update ; sudo apt-fast -y --force-yes dist-upgrade'
alias apt-get='apt-fast'
alias repload_unity="DISPLAY=:0 unity --replace"
alias repload_compiz="DISPLAY=:0 compiz --replace"
alias giver="/usr/bin/mono --runtime=v4.0 /usr/lib/giver/Giver.exe"
histgrep () 
{ 
    history | grep $1
}
mkcd () 
{ 
    mkdir -p $1 && cd $1
}
psgrep () 
{ 
    ps aux | grep $1 | grep -v grep
}
quote () 
{ 
    echo \'${1//\'/\'\\\'\'}\'
}
quote_readline () 
{ 
    local quoted;
    _quote_readline_by_ref "$1" ret;
    printf %s "$ret"
}
set_prefix () 
{ 
    [ -z ${prefix:-} ] || prefix=${cur%/*}/;
    [ -r ${prefix:-}CVS/Entries ] || prefix=""
}
watch () 
{ 
    if [ $# -ne 1 ]; then
        tail -f nohup.out;
    else
        tail -f $1;
    fi
}




