#!/bin/bash


betaflight () {  # standalone available
    sudo adduser $USER dialout &&
    install_from_online_deb betaflight $betaflight_url &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

blackbox () { install_from_online_deb bf_blackbox_explorer $blackbox_url ;}  # standalone available

blheli32 () { download_standalone_app_archive BLHeli_32 $blheli32_url ;}

expresslrs () { 
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules &&
    sudo service udev restart &&
    sudo adduser $USER dialout &&
    sudo adduser $USER plugdev &&
    install_from_online_deb expresslrs $expresslrs_url &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

inav () { 
    download_targz_app_archive inav $inav_url
    chmod +x $portable_apps_path/INAV\ Configurator/inav-configurator &&
    chmod +x $portable_apps_path/INAV\ Configurator/chrome_crashpad_handler &&
    sudo apt install libatomic1 -y &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }

cura () { download_appimage Cura $cura_url ;}

openscad () { install_using_apt openscad ;}

blender () { download_tarxz_app_archive Blender $blender_url ;}

shotcut () { install_using_apt shotcut ;}

gyroflow () { download_appimage GyroFlow $gyroflow_url ;}

wings_sim () { 
    package=Wings_Sim
    download_standalone_app_archive $package $wings_sim_url
    chmod +x $portable_apps_path/$package/Wings.x86_64 &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }


fpv_group () {
    betaflight &&
    blackbox &&
    blheli32 &&
    expresslrs &&
    inav &&
    cura &&
    openscad &&
    blender &&
    shotcut &&
    gyroflow &&
    wings_sim &&
    log_success $FUNCNAME || log_failure $FUNCNAME
    }
