#!/bin/bash

#This script is intented to use with Arch Linux or distros based on it. You may have to change this script according to your distro.

#checking if neovim is installed 
if pacman -Qs neovim >/dev/null 2>&1; then
  echo "neovim ✅"
else
  sudo pacman -S neovim 
fi 

#checking if lunarvim is installed 
lvim_path="$HOME/.local/bin/lvim"
if
  [ -f "$lvim_path" ]; then 
  echo "lunarvim ✅"
else
 LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
  ./test.sh 
fi
  
#config files
cp config.lua ~/.config/lvim/
cp dashboard.lua ~/.local/share/lunarvim/lvim/lua/lvim/core/alpha/

if [ "$SHELL" = "/bin/bash" ]; then
    echo "alias nvim='~/.local/bin/lvim'" >> ~/.bashrc 
elif [ "$SHELL" = "/bin/zsh" ]; then
    echo "alias nvim='~/.local/bin/lvim'" >> ~/.zshrc 
else
    echo "alias nvim='~/.local/bin/lvim'" >> ~/.config/fish/config.fish 
fi

echo "CHANGE HAS BEEN MADE FOR $SHELL ✅"

#checking if yazi is installed 
if pacman -Qs yazi >/dev/null 2>&1; then 
  sudo rm /usr/local/bin/vi 
  sudo ln -s ~/.local/bin/lvim /usr/local/bin/vi
  else 
    read -p "Do you want to install yazi?(y/n): " answer
    answer=${answer,,}  
    if [ "$answer" = "y" ]; then
      sudo pacman -S yazi     
    elif [ "$answer" = "n" ]; then
      echo "No package installation requested. Exiting."
    else
      echo "Invalid input. Please enter 'y' or 'n'."
    fi
fi

#final steps 
read -p "Do you want to remove this script?(y/n): " final
final=${final,,}
if [ "$final" = "y" ]; then
  echo "goodbye :-)"
  cd .. && rm -rf lvimconf/ 
elif [ "$final" = "n" ]; then 
  echo "see ya again ;-)"
else 
  echo "Invalid input. Please enter 'y' or 'n'."
fi
