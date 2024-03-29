# Post-Install
## Linux_post-intall_script
Scripts for preparing linux environmental

Pos-install scripts are made to execute after install linux OS (example:UBUNTU).

This **scripts will install programs automatically**, this is my config.
  
  1. Download the file posinstall.sh into Download file.
  2. In the directory (/home/$USER/Downloads) execute the script in "sudo" mode with "./" command
  
    example:
    1.sudo chmod 777 posintall.sh or chmod +urwx posintall.sh
    2.sudo ./post_intall.sh
    
 Script **Tested with POP-OS 22.04 & Ubuntu 22.04** = status ok|May 2022
  
 Versions should works for Debian, ElemntaryOS e Mint with little adaptation.

_Old_distros: Pop_OS 21.10 Ubuntu 20.04  Mint 19.3 & Ubuntu 18.04.3 = status ok|Jan 2020_
  
---
# Windows 11 post-install

This **scripts will install programs automatically**, this is my config for windos 11.

1. Copy the winget commands in the file ´win11.ps1´
2. Paste at Terminal and enter.

To update the files use the command:
```bash
winget upgrade --all
```
![](https://i.imgur.com/4duwM0P.png)

P.S. For Anaconda enviroment use administrator privileges.

---
# Auto_snap or auto_flat or auto_apt

This script will install programs from this especific app managers.

1. Download the file auto_*.sh into Download file. # * = name of different file used e.g = auto_snap or auto_flat
2. In the directory (/home/$USER/Downloads) execute the script in "sudo" mode with "./" command
  
    example:
    1.sudo chmod 777 auto_apt.sh
    2.sudo ./auto_apt.sh
    
 Script  = status ok|May 2022  **tested with POP-OS & Ubuntu 22.04**
 

---

# Anaconda auto install
Script to auto install toolKit for science. 

This **scripts will install Anaconda automatically**.
  
  1. Save the file with name.sh - example: anaconda.sh
  2. In the directory (/home/$USER/Downloads) execute the script in "sudo" mode with "./" command
    
    example:
    sudo chmod 777 anaconda.sh
    sudo ./anaconda.sh  

 #### P.S.: Sometimes an error with "anaconda-navigator" occur, subscribing the "$USER" like "root" ####
 #### To solve this issue, edit the file at 'sudo' in the terminal with gedit or nano.####
 #### Put your name of "$USER" in the place that is write "root" ####
    
    example:      
    cd /usr/share/applications/
    sudo gedit Anaconda-Navigator
    
    correction:
    Exec=bash -c 'export PATH="/home/$USER/Downloads/anaconda3/bin:$PATH" && /home/$USER/anaconda3/bin/anaconda-navigator'
    Categories=Development;Science;IDE;Qt;Education;
    Icon=/home/$USER/anaconda3/lib/python3.8/site-packages/anaconda_navigator/static/images/anaconda.png
   
  And save the edited file.
#### Done! ####

---
# Flavors auto install - experimental process

This **scripts will install different flavors as an option into the user login**.
Open the script and delete the "#" in the flavor select to install into your system.

  1. Save the file with name.sh - example: flavors.sh
  2. In the directory (/home/$USER/Downloads) execute the script in "sudo" mode with "./" command
    
    example:
    sudo chmod 777 flavor.sh
    sudo ./flavor.sh  

---

## Authors

- [Ref](https://github.com/Diolinux/Linux-Mint-19.x-PosInstall)actor by [@BragatteMAS](https://github.com/BragatteMAS). Thanks to [Diolinux for the inspiration and FOSS philosophy](https://www.youtube.com/watch?v=vBfj5dNZOSA&t=8s).
