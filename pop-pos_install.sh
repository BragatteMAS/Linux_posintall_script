#!/usr/bin/env bash 

##	+-----------------------------------+-----------------------------------+
##	|                                                                       |
##	|                        Pos Install Scrypt                             |
##	|                                                                       |
##	| Copyright (c) 2021, Bragatte <marcelobragatte@gmail.com>.             |
##	|                                                                       |
##	| All programs are free software: you can redistribute it and/or modify |
##	| it under the terms of the GNU General Public License as published by  |
##	| the Free Software Foundation, either version 3 of the License, or     |
##	| (at your option) any later version.                                   |
##	|                                                                       |
##	| This script should be run with SUDO command.                          |
##	| Detail instructions:                                                  |
##	| <https://github.com/BragatteMAS/Linux_posintall_script> 		|
##      | POP-OS 21.04 version 	- Tested 202107				                |
##	+-----------------------------------------------------------------------+

echo ' \n Auto install Bragatte_mode!!!! \n	'

# -------------------------------------------------------------------------- #
#APT command line package used to install programs Debian/Ubuntu distros stores
# -----------------------------VARIABLES APT-------------------------------- #
APT_INSTALL=(
synaptic              		#System|program manager
neofetch              		#System|verify info term
gufw                  		#System|firewall for linux
git git-lfs           		#System|control modifications
stacer                		#System|clean and monitor programs
alacritty             		#System|GPU enhanced terminal
timeshift             		#System|backup
virtualbox-qt         		#System|emulate OS	'sudo adduser $USER vboxusers'
nemo                   		#System|file manager

flameshot             		#Image|capture screen with shortcut system
zsh                    		#Terminal|alternative option for bash in terminal
terminator            		#Terminal|high configurtion term
gnome-sushi            		#Image|previsualize files pressing space Nautilus
ffmpeg                		#Image|extension

simplescreenrecorder  		#Video|capture and film screen

lutris piper ratbagd wine      	#Games|systems

openssh-server                  #System|remotely controlling & transferring
tigervnc-viewer                 #System|VNC

openconnect network-manager-openconnect network-manager-openconnect-gnome      		  #System|VPN
openvpn network-manager-openvpn network-manager-openvpn-gnome                   	  #System|ProtonVPN
gnome-tweaks gnome-shell-extensions gnome-shell-extension-prefs chrome-gnome-shell	#Gnome|desktop utilities

)
# -------------------------------------------------------------------------- #
#Programs select from SNAP store <https://snapcraft.io/store>
# -----------------------------VARIABLES SNAP------------------------------- #
SNAP_INSTALL=(
bing-wall          	#Image|Wallpapers automatically generated
photogimp          	#Image|patch 'Adobe' for GIMP

bpytop	          	#System|memory verify
authy               #System|backup two steps factors

homeserver	        #Productivity|Share folders in urls
docker             	#Productivity|container environmental 'sudo groupadd docker' && 'sudo usermod -aG docker $USER'
qsnapstore         	#Productivity|Snap store improved

weka-james-carroll 	#Research|ML
)
# --------------------------------------------------------------------------- #
#Programs select from Flathub store <https://flathub.org/home>
# -----------------------------VARIABLES FLAT-------------------------------- #
FLAT_INSTALL=(
com.bitwarden.desktop	  	#System|password manager
flatseal              		#System|permissions
filezilla              		#System|SQL manager
gpuviewer		            	#System|GPU easy info
OnionShare            		#System|transfer files safety
org.gnome.Boxes       		#System|virtualization

pavucontrol	      	    	#Sound|Control
com.spotify.Client	    	#Sound|digital music service
org.audacityteam.Audacity #Sound|Record and edit audio files

com.uploadedlobster.peek	#Image|gif creator
org.inkscape.Inkscape	  	#Image|vector graphics software

org.kde.kdenlive	        #Video|Edition
obsproject.Studio      		#Video|streaming software
org.videolan.VLC      		#Video|media player open-source
org.blender.Blender    		#Video|3D pipeline—model,animation,simulation,rendering

com.valvesoftware.Steam		#Games|systems

zoom                  		#Comunication|webinars
slack                  		#Comunication|team chat
org.telegram.desktop	  	#Comunication|popular messaging protocol
com.discordapp.Discord		#Comunication|messaging electron framework

org.chromium.Chromium		#Productivity|browser
io.gitlab.librewolf-community	#Productivity|browser

dropbox               		#Productivity|online files manager storage
nz.mega.MEGAsync       		#Productivity|online files manager storage

masterpdf              		#Productivity|pdf-editor
com.wps.Office         		#Productivity|office reader for doc win
calibre                		#Productivity|reader kindle types
fontfinder             		#Productivity|design
openboard              		#Productivity|educational software interactive board
com.github.johnfactotum.Foliate	#Productivity|ebook viewer

com.visualstudio.code		#Productivity|Best IDE
meld                   		#Productivity|diif across files
gitkraken              		#Productivity|code commit

blanket	                	#Productivity|back environmental sounds to work
organizer              		#Productivity|shifts files according to their filetype
com.toggl.TogglDesktop 		#Productivity|design
com.gitlab.cunidev.Workflow 	#Productivity|timecontrol

geogebra               		#Research|dynamic geometry program
org.pymol.PyMOL			#Research|3D viewer
org.zotero.Zotero      		#Research|References
org.jaspstats.JASP     		#Research|real-time, statisticial spreadsheet
md.obsidian.Obsidian		#Research|Link your thinking
)
# ---------------------------------------------------------------------- #
#Deb packages
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#PPA
#sudo add-apt-repository ppa:lutris-team/lutris

### --------------------- Basic system utilities ---------------------- ###
## Removing any apt locks ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adding / Confirming 32-bit Architecture ##
sudo dpkg --add-architecture i386

## Updating the repository ##
sudo apt update -y

##Packages of apps for Linux
sudo apt install snapd -y

sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ---------------------------------------------------------------------- #
## Install programs APT
for apt_program in ${APT_INSTALL[@]}; do
  if ! dpkg -l | grep -q $apt_program; then     # Just install if not exist
    apt install -y "$apt_program"               #$# Change this line if you have other distro than debian/ubuntu base
  else
    echo "[successful installation] - $apt_program"
  fi
done

## Install programs SNAP
for snap_program in ${SNAP_INSTALL[@]}; do
  if ! dpkg -l | grep -q $snap_program; then # Just install if not exist
    snap install "$snap_program" 
  fi
done

## Install programs FLATPAK
for flat_program in ${FLAT_INSTALL[@]}; do
  if ! dpkg -l | grep -q $flat_program; then # Just install if not exist
    flatpak install flathub "$flat_program" -y
  fi
done

### --------------------------- Exceptions----------------------------- ###
## Brave Browser
sudo apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y   #faster/browser

##Github Desktop
wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'
sudo apt-get update
sudo apt install github-desktop -y


### ------------------------------------------------------------------- ###
## Download and install external programs .deb ##
HOME="$(getent passwd $SUDO_USER | cut -d: -f6)"
Dir_Downloads="$HOME/Downloads/Programs"
mkdir "$Dir_Downloads"
sudo chmod 777 -R "$Dir_Downloads"
wget -c "$URL_GOOGLE_CHROME" -P "$Dir_Downloads"

## Installing .deb packages ##
sudo dpkg -i $Dir_Downloads/*.deb
sudo apt update -y

### ---------------------------- After install ------------------------ ###

# ---------------------------------------------------------------------- #

#sudo add-apt-repository --remove ppa:lutris-team/lutris
sudo add-apt-repository --remove ppa:linux/chrome/deb/

# ---------------------------------------------------------------------- #
sudo apt update && sudo apt upgrade && apt dist-upgrade -y
sudo snap refresh
flatpak update -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
echo '\n All done! Reboot your pc, run this script a second time to check the instalation confirmation message and keep walking!'
### ------------------------------------------------------------------- ####

