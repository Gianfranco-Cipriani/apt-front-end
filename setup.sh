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

# Install prerequisite packages
sudo apt install dialog
echo "install required packages done"

# Check for shell type and make an alias
echo make an alias...
if [ $SHELL == "/usr/bin/bash" -o $SHELL == "/bin/bash" ]
then
    sudo printf "%s\n" "alias sys-maintenance=~/apt-front-end/apt-front-end-1.0.0.sh" >> ~/.bashrc
    echo "alias sys-maintenance set"
elif [ $SHELL == "/bin/zsh" -o $SHELL == "/usr/bin/zsh"]
then
    sudo printf "%s\n" "alias sys-maintenance=~/apt-front-end/apt-front-end-1.0.0.sh" >> ~/.zshrc
    echo "alias sys-maintenance set"
fi

# make the main script executable
sudo chmod +x apt-front-end-1.0.0.sh

echo Done
