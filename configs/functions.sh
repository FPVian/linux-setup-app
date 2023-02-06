#!/bin/bash


log_success () {
    echo "INFO: $* success" | tee -a $log_path
    }

log_failure () {
    echo "WARNING: $* FAILURE" | tee -a $log_path
    }

update_apt () {
    sudo apt update &&
    sudo apt upgrade -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

install_using_apt () {  # $1 = apt package name
    sudo apt install $1 -y &&
    log_success $1 $FUNCNAME || log_failure $1 $FUNCNAME
    }

install_flatpak () {  # $1 = flathub path
    flatpak install flathub $1 -y &&
    log_success $FUNCNAME "from flathub path:" $1 || 
    log_failure $FUNCNAME "from flathub path:" $1
    }

install_from_online_deb () {
    package=$1
    url=$2

    wget -O $wd/$package.deb "$url" &&
    sudo apt install $wd/$package.deb -y &&
    rm $wd/$package.deb &&
    log_success $package $FUNCNAME ||
    log_failure $package $FUNCNAME "url:" $url
    }

download_appimage () {
    package=$1
    url=$2

    mkdir -p $portable_apps_path &&
    wget -O $portable_apps_path/$package.AppImage "$url" &&
    chmod +x $portable_apps_path/$package.AppImage &&
    log_success $package $FUNCNAME ||
    log_failure $package $FUNCNAME "from:" $url
    }

download_standalone_app_archive () {
    package=$1
    url=$2

    mkdir -p $portable_apps_path &&
    wget -O $portable_apps_path/$package.zip "$url" &&
    unzip -o $portable_apps_path/$package.zip -d $portable_apps_path/$package &&
    rm $portable_apps_path/$package.zip &&
    log_success $package $FUNCNAME ||
    log_failure $package $FUNCNAME "from:" $url
    }

download_targz_app_archive () {
    package=$1
    url=$2

    mkdir -p $portable_apps_path &&
    wget -O $portable_apps_path/$package.tar.gz "$url" &&
    tar -xf $portable_apps_path/$package.tar.gz -C $portable_apps_path &&
    rm $portable_apps_path/$package.tar.gz &&
    log_success $package $FUNCNAME ||
    log_failure $package $FUNCNAME "from:" $url
    }

download_tarxz_app_archive () {
    package=$1
    url=$2

    mkdir -p $portable_apps_path &&
    wget -O $portable_apps_path/$package.tar.xz "$url" &&
    tar -xf $portable_apps_path/$package.tar.xz -C $portable_apps_path &&
    rm $portable_apps_path/$package.tar.xz &&
    log_success $package $FUNCNAME ||
    log_failure $package $FUNCNAME "from:" $url
    }

install_from_local_deb () {  # $1 = filename
    sudo apt install ./assets/debs/$1.deb -y &&
    log_success $1 $FUNCNAME || log_failure $1 $FUNCNAME
    }
