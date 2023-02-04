#!/bin/bash


1password () {  # deb available
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg --y &&
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list &&
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ &&
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol &&
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 &&
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg --y &&
    sudo apt update && sudo apt install 1password -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

insync () {  # deb available
    { sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C ||
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C
    } &&
    echo "deb http://apt.insync.io/$linux_distribution $linux_version_codename non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list &&
    sudo apt update && sudo apt install insync -y &&
    mkdir -p ~/Insync/$google_email/"Google Drive" &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

mailspring () {  # snap available
    install_from_online_deb mailspring $mailspring_url
    }

veracrypt () { install_from_online_deb veracrypt $veracrypt_url ;}

tlp_powersave () {
    sudo apt install tlp -y &&
    sudo tlp start &&
    sudo systemctl enable tlp.service &&
    echo "PCIE_ASPM_ON_BAT=powersupersave" | sudo tee /etc/tlp.d/framework.conf &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

chrome () { install_from_online_deb chrome $chrome_url ;}

virtualbox () {
    sudo apt install virtualbox -y &&
    gnome-terminal -- bash "$ROOT_DIR"/scripts/interactive/supervised.sh virtualbox_ext_pack &&
    mkdir -p ~/"VirtualBox VMs"/ISOs &&
    sudo adduser $USER vboxusers &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }


productivity_group () {
    1password &&
    insync &&
    mailspring &&
    veracrypt &&
    tlp_powersave &&
    chrome &&
    virtualbox &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }
