#!/bin/bash


# Copyright (C) 2020 Gianfranco Cipriani
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.
#
# Contact me on gianfrancocipriani@hotmail.com


############################################################
# WARNING: make sure to execute this script as SUDO
# Leave files paths untouched otherwise modify this script
# to work properly.
############################################################

# Terminal colors for echo messages
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Install prerequisite packages
sudo apt install dialog
echo -e "${GREEN}install required packages done${NC}"

# Check for shell type, make an alias and reload shell .rc file
echo -e "${GREEN}make an alias...${NC}"
if [ $SHELL == "/usr/bin/bash" ] || [ $SHELL == "/bin/bash" ]
then
    sudo printf "%s\n" "alias sys-maintenance=~/apt-front-end/apt-front-end-1.0.0.sh" >> ~/.bashrc
    echo -e "${GREEN}alias sys-maintenance set${NC}"
elif [ $SHELL == "/usr/bin/zsh" ] || [ $SHELL == "/bin/zsh" ]
then
    sudo printf "%s\n" "alias sys-maintenance=~/apt-front-end/apt-front-end-1.0.0.sh" >> ~/.zshrc
    echo -e "${GREEN}alias sys-maintenance set${NC}"
fi

# make the main script executable
sudo chmod +x apt-front-end-1.0.0.sh

echo -e "${GREEN}Done${NC}"
echo -e "${GREEN}Restart terminal for changes to take effect${NC}"
