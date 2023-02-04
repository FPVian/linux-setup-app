#!/bin/bash


pip () { install_using_apt python3-pip ;}

git_config () {
    install_using_apt git
    git config --global user.name $git_username &&
    git config --global user.email $git_email &&
    mkdir -p $git_directory &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

vscode () {  # snap/deb available
    sudo apt-get install wget gpg &&
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg &&
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' &&
    rm -f packages.microsoft.gpg &&
    sudo apt install apt-transport-https &&
    sudo apt update && sudo apt install code -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

nodejs () { install_using_apt nodejs ;}

insomnia () { install_from_online_deb insomnia $insomnia_url ;}  # appimage available

dbeaver () { # flatpak/snap available
    sudo add-apt-repository ppa:serge-rider/dbeaver-ce -y &&
    sudo apt update &&
    sudo apt install dbeaver-ce &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

parsec () { install_from_online_deb parsec $parsec_url ;}


coding_group () {
    pip &&
    git_config &&
    vscode &&
    nodejs &&
    insomnia &&
    dbeaver &&
    parsec &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }
