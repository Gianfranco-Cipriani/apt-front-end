#!/bin/bash

: '
               __              _____                      __                               .___
_____  _______/  |_          _/ ____\______  ____   _____/  |_            ____   ____    __| _/
\__  \ \____ \   __\  ______ \   __\\_  __ \/  _ \ /    \   __\  ______ _/ __ \ /    \  / __ | 
 / __ \|  |_> >  |   /_____/  |  |   |  | \(  <_> )   |  \  |   /_____/ \  ___/|   |  \/ /_/ | 
(____  /   __/|__|            |__|   |__|   \____/|___|  /__|            \___  >___|  /\____ | 
     \/|__|                                            \/                    \/     \/      \/ 

sɪᴍᴘʟᴇ ᴀᴘᴛ ғʀᴏɴᴛ-ᴇɴᴅ ᴛᴏ ᴍᴀɴᴀɢᴇ ᴘᴀᴄᴋᴀɢᴇs ᴀɴᴅ sʏsᴛᴇᴍ ᴍᴀɪɴᴛᴇɴᴀɴᴄᴇ


Copyright (C) 2020  Gianfranco Cipriani

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

Contact me on <gianfrancocipriani@hotmail.com>'

# Store menu options selected by the user
INPUT="$(mktemp /tmp/main_menu.XXXXXXXXXXXXXXXXXXXXXXX.sh)"

# Store packages inserted by the user
OUTPUT="$(mktemp /tmp/output.XXXXXXXXXXXXXXXXXXXXXXX.sh)"

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; clear; exit" SIGHUP SIGINT SIGTERM


main_menu(){
    while true
          do
              dialog  --clear --stdout --title "Linux System Maintenance" \
                      --menu "Please choose an option:" 15 60 5 \
                      1 "Update repository lists" \
                      2 "Upgrade entire system" \
                      3 "Clean cache and unused packages" \
                      4 "Package Managment Menu" \
                      5 "Exit">"${INPUT}"

              choice=$(<"${INPUT}")

              case "$choice" in
	                1)
                      clear
	                    sudo apt update && sleep 3
	                    ;;

	                2)
                      clear
	                    sudo apt upgrade && sudo apt full-upgrade && sleep 3
	                    ;;

	                3)
                      clear
	                    sudo apt clean && sudo apt autoclean && sudo apt autoremove && sleep 3
	                    ;;

	                4)
	                    packages_menu
	                    ;;

                  5)
                      clear
                      exit 0
                      ;;

                  *)
                      clear
                      return 0
                      ;;
              esac
    done
}

packages_menu(){
    while true
          do

              dialog  --clear --stdout --title "Linux Package Managment" \
                      --menu "Please choose an option:" 15 60 5 \
                      1 "Install one or more packages" \
                      2 "Remove one or more packages" \
                      3 "Remove one or more packages and relative configs" \
                      4 "Back to main Menu" \
                      5 "Exit">"${INPUT}"

              choice=$(<"${INPUT}")

              case $choice in

                  1)
                      dialog --clear --stdout --title "Install packages" \
                             --backtitle "Linux Package Managment" \
                             --inputbox "Insert each package name followed by a space" 8 50 >$OUTPUT
                      install_packages=$(<$OUTPUT)
                      clear
                      sudo apt install $install_packages && sleep 3
                      ;;

                  2)
                      dialog --clear --stdout --title "Remove packages" \
                             --backtitle "Linux Package Managment" \
                             --inputbox "Insert each package name followed by a space" 8 50 >$OUTPUT
                      remove_packages=$(<$OUTPUT)
                      clear
                      sudo apt remove $remove_packages && sleep 3
                      ;;

                  3)
                      dialog --clear --stdout --title "Remove packages & configs" \
                             --backtitle "Linux Package Managment" \
                             --inputbox "Insert each package name followed by a space" 8 50 >$OUTPUT
                      remove_purge_packages=$(<$OUTPUT)
                      clear
                      sudo apt remove --purge --auto-remove $remove_purge_packages && sleep 3
                      ;;
                  4)
                      main_menu
                      ;;
                  5)
                      clear
                      exit 0
                      ;;

                  *)
                      clear
                      return 0
                      ;;
              esac
    done
}

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT

main(){

   main_menu
}

main


