alias 7z_uber='7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias dot='ls .[a-zA-Z0-9_]*'
alias grep='grep --color=auto'
alias h='history'
alias l='ls -CF'
alias la='ls -Al'
alias ll='ls -l'
alias ls='ls --color=auto'
alias ss='ps -aux'
#alias update='sudo apt-get -y --force-yes update ; sudo apt-get -y --force-yes dist-upgrade'
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

