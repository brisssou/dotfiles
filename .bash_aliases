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
alias update='sudo apt update ; sudo apt dist-upgrade ; sudo apt autoclean ; sudo apt autoremove ; sudo snap refresh'
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

GIT_DIRS=$(echo ~/work/jmoab/* ~/work/git)
function git_all() {
    local CYAN="\033[0;36m"
    local NO_COLOUR="\033[0m"

    pushd $PWD &>/dev/null
    for d in $GIT_DIRS ; do
        if [[ ! -d ${d} ]] ; then continue; fi
        for i in ${d}/*
        do
          if [[ ! -d ${i} ]] ; then continue; fi
          pushd $i &>/dev/null
          echo -e "$CYAN$PWD$NO_COLOUR"
          # sed special color codes
          echo -e "$(git $@ 2> >(sed "s/\(error.*\)/\\\e[00;31m\1\\\e[0m/"))"
          popd &>/dev/null
        done
    done
    popd &>/dev/null
}

alias git_pull='git_all pull -r --autostash'
alias git_fetch='git_all fetch'
alias git_st='git_all status'
alias git_branches='git_all branch'
alias mvn='mvn -Djna.nosys=true'

alias jmoab_refresh="(cd ~/work/jmoab; mvn bfs:refresh-moab)"
alias jmoab_install="(cd ~/work/jmoab; mvn clean install -DskipTests)"
alias jmoab_rni='git_pull;(cd ~/work/jmoab; rm pom.xml; echo "Recreating the pom"; mvn bfs:create-pom);echo "Refreshing jMoab"; jmoab_refresh;echo "Installing jMoab"; jmoab_install'
