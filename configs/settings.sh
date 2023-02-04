#!/bin/bash


# paths
wd=~/Desktop
log_path=$wd/setup_log.txt
portable_apps_path=~/"Portable-Apps"

# InSync settings
linux_distribution='mint'
linux_version_codename='vanessa'

# cinnamon settings
mouse_speed=0.4
touchpad_speed=0.4
backround_picture_path='/usr/share/backgrounds/linuxmint-vanessa/echerkasski_orketal.jpg'
theme='Mint-Y-Dark-Red'
cursor='Adwaita'
icons='Mint-Y-Legacy-Dark-Red'
favorite_folders_list="['file:///home/$USER/Insync/<google_email>/Google%20Drive::inode/directory',\
                        'file:///home/$USER/Portable-Apps::inode/directory']"
favorite_apps_list="['firefox.desktop', 'Mailspring.desktop', '1Password.desktop',\
                     'webapp-Notion.desktop', 'steam.desktop', 'discord.desktop',\
                     'code.desktop']"

# git settings
git_username='<username>'
git_email=<github_email>
git_directory=~/github

# insync settings
google_email='<google_email>'

# download urls
veracrypt_url="https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb"
chrome_url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
mailspring_url="https://updates.getmailspring.com/download?platform=linuxDeb"
discord_url="https://discord.com/api/download?platform=linux&format=deb"
parsec_url="https://builds.parsec.app/package/parsec-linux.deb"
minecraft_url="https://launcher.mojang.com/download/Minecraft.deb"
insomnia_url="https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app"
wings_sim_url="https://www.wings-sim.com/build/WingsLinuxBuild.zip"
# version-locked download urls
cura_url="https://github.com/Ultimaker/Cura/releases/download/5.2.1/Ultimaker-Cura-5.2.1-linux-modern.AppImage"
betaflight_url="https://github.com/betaflight/betaflight-configurator/releases/download/10.9.0/betaflight-configurator_10.9.0_amd64.deb"
blackbox_url="https://github.com/betaflight/blackbox-log-viewer/releases/download/3.6.0/betaflight-blackbox-explorer_3.6.0_amd64.deb"
blheli32_url="https://github.com/bitdump/BLHeli/releases/download/BLHeliSuite32_32.9.0.5/BLHeliSuite32xLinux64_1040.zip"
expresslrs_url="https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v1.5.5/expresslrs-configurator_1.5.5_amd64.deb"
gyroflow_url="https://github.com/gyroflow/gyroflow/releases/download/v1.4.2/Gyroflow-linux64.AppImage"
inav_url="https://github.com/iNavFlight/inav-configurator/releases/download/5.1.0/INAV-Configurator_linux64_5.1.0.tar.gz"
openrgb_url="https://openrgb.org/releases/release_0.8/OpenRGB_0.8_x86_64_fb88964.AppImage"
blender_url="https://mirrors.ocf.berkeley.edu/blender/release/Blender3.4/blender-3.4.1-linux-x64.tar.xz"
