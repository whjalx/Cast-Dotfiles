#!/bin/bash

# Define color codes for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== cast-dotfiles Installer ===${NC}"

# Ensure ~/.config exists
mkdir -p ~/.config

# Function to prompt user
prompt_install() {
    local name="$1"
    local config_dir="$2"
    local packages="$3"

    echo -e "\n${YELLOW}Do you want to setup ${name}? (y/n)${NC}"
    read -rp "> " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        # Install packages
        if [ -n "$packages" ]; then
            echo -e "${GREEN}Installing packages: ${packages}...${NC}"
            # Using yay for AUR support, fallback to pacman 
            if command -v yay &> /dev/null; then
                yay -S --needed --noconfirm $packages
            elif command -v pacman &> /dev/null; then
                sudo pacman -S --needed --noconfirm $packages
            else
                echo -e "WARNING: Could not find yay or pacman. Please install ${packages} manually."
            fi
        fi

        # Symlink dotfiles
        echo -e "${GREEN}Symlinking ${name} config...${NC}"
        # Backup existing config if it's there
        if [ -d "$HOME/.config/$config_dir" ] && [ ! -L "$HOME/.config/$config_dir" ]; then
            echo "Backing up existing ~/$config_dir to ~/$config_dir.bak"
            mv "$HOME/.config/$config_dir" "$HOME/.config/${config_dir}.bak"
        elif [ -L "$HOME/.config/$config_dir" ]; then
            rm "$HOME/.config/$config_dir"
        fi

        ln -s "$PWD/$config_dir" "$HOME/.config/$config_dir"
        echo -e "${GREEN}Done with ${name}!${NC}"
    else
        echo -e "Skipping ${name}..."
    fi
}

echo "This script will ask you if you want to install and link each configuration."

prompt_install "Atuin" "atuin" "atuin"
prompt_install "Broot" "broot" "broot"
prompt_install "Btop" "btop" "btop"
prompt_install "Cava" "cava" "cava"
prompt_install "Eww" "eww" "eww-wayland"
prompt_install "Fish" "fish" "fish"
prompt_install "Htop" "htop" "htop"
prompt_install "Hyprland" "hypr" "hyprland hyprpaper hyprlock"
prompt_install "Kitty" "kitty" "kitty"
prompt_install "Neovim" "nvim" "neovim"
prompt_install "Rofi" "rofi" "rofi rofi-wayland"
prompt_install "Pywal" "wal" "python-pywal"
prompt_install "Waybar" "waybar" "waybar"
prompt_install "Wofi" "wofi" "wofi"

echo -e "\n${BLUE}=== Installation Complete! ===${NC}"
