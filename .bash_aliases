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
alias update='sudo apt-get -y --force-yes update ; sudo apt-get -y --force-yes dist-upgrade ; sudo apt-get autoclean ; sudo apt-get -y --force-yes autoremove'
alias tunnel_to_jenkins='ssh tedemis@admin1.tedemis.com -NfL 6661:jenkins2.tedemis.com:8081;echo http://localhost:6661/'
alias repload_unity="DISPLAY=:0 unity --replace"
alias repload_compiz="DISPLAY=:0 compiz --replace"
alias vagrant=/usr/bin/vagrant
alias bundle='PATH=/usr/sbin:/usr/bin:$PATH bundle'
alias be='bundle exec'
alias bek='be kitchen'
alias fuck='$(thefuck $(fc -ln -1))'
# You can use whatever you want as an alias, like for mondays:
alias FUCK='fuck'

function git_all() {
    pushd $PWD
    cd ~/work/git
    for i in cem* ; do echo $i ; cd $i; git $@ ; cd .. ; done
    popd
}

alias git_pull='git_all pull -r'
alias git_fetch='git_all fetch'
alias git_st='git_all status'
alias git_branches='git_all branch'
