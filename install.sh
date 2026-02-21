#!/bin/bash

# Define color codes for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== 🌟 Instalador de Dotfiles de Cast ===${NC}"

# Ensure ~/.config exists
mkdir -p ~/.config

# Function to prompt user
prompt_install() {
    local name="$1"
    local config_item="$2"
    local packages="$3"

    echo -e "\n${YELLOW}¿Deseas instalar y configurar ${name}? (s/n)${NC}"
    read -rp "> " choice
    if [[ "$choice" =~ ^[SsYy]$ ]]; then
        # Install packages
        if [ -n "$packages" ]; then
            echo -e "${GREEN}Instalando paquetes: ${packages}...${NC}"
            # Using yay for AUR support, fallback to pacman 
            if command -v yay &> /dev/null; then
                yay -S --needed --noconfirm $packages
            elif command -v pacman &> /dev/null; then
                sudo pacman -S --needed --noconfirm $packages
            else
                echo -e "${RED}ADVERTENCIA: No se encontró yay ni pacman. Por favor instala ${packages} manualmente.${NC}"
            fi
        fi

        # Symlink dotfiles
        echo -e "${GREEN}Vinculando la configuración de ${name}...${NC}"
        # Backup existing config if it's there
        if [ -e "$HOME/.config/$config_item" ] && [ ! -L "$HOME/.config/$config_item" ]; then
            echo "Respaldando ~/$config_item existente a ~/${config_item}.bak"
            mv "$HOME/.config/$config_item" "$HOME/.config/${config_item}.bak"
        elif [ -L "$HOME/.config/$config_item" ]; then
            rm "$HOME/.config/$config_item"
        fi

        ln -s "$PWD/$config_item" "$HOME/.config/$config_item"
        echo -e "${GREEN}¡Configuración de ${name} lista!${NC}"
    else
        echo -e "Omitiendo ${name}..."
    fi
}

echo "Este script te preguntará si deseas instalar y vincular cada componente."
echo "Presiona 's' para Sí, o cualquier otra tecla para omitir."

echo -e "\n${BLUE}--- Entornos de Escritorio y Gestores de Ventanas ---${NC}"
prompt_install "Hyprland (Gestor Wayland)" "hypr" "hyprland hyprpaper hyprlock"
prompt_install "BSPWM (Gestor X11)" "bspwm" "bspwm"

echo -e "\n${BLUE}--- Terminales y Shells ---${NC}"
prompt_install "Kitty (Terminal Wayland/X11)" "kitty" "kitty"
prompt_install "Fish (Shell)" "fish" "fish"
prompt_install "Starship (Prompt)" "starship.toml" "starship"

echo -e "\n${BLUE}--- Lanzadores de Aplicaciones ---${NC}"
prompt_install "Rofi / Rofi-Wayland" "rofi" "rofi rofi-wayland"
prompt_install "Wofi (Lanzador Wayland)" "wofi" "wofi"

echo -e "\n${BLUE}--- Barras de Estado ---${NC}"
prompt_install "Waybar (Barra Wayland)" "waybar" "waybar"
prompt_install "Polybar (Barra X11)" "polybar" "polybar"
prompt_install "Eww (Widgets Wayland/X11)" "eww" "eww-wayland"

echo -e "\n${BLUE}--- Editores de Texto ---${NC}"
prompt_install "Neovim" "nvim" "neovim"

echo -e "\n${BLUE}--- Utilidades de Sistema ---${NC}"
prompt_install "Btop (Monitor de sistema)" "btop" "btop"
prompt_install "Htop (Monitor de sistema)" "htop" "htop"
prompt_install "Fastfetch (Info de sistema)" "fastfetch" "fastfetch"
prompt_install "Neofetch (Info de sistema)" "neofetch" "neofetch"
prompt_install "Ranger (Gestor de archivos CLI)" "ranger" "ranger"
prompt_install "Broot (Gestor de archivos interactivo)" "broot" "broot"
prompt_install "Atuin (Historial de Shell interactivo)" "atuin" "atuin"

echo -e "\n${BLUE}--- Apariencia y Multimedia ---${NC}"
prompt_install "Pywal (Generador de colores)" "wal" "python-pywal"
prompt_install "NWG-Look (Utilidad GTK Wayland)" "nwg-look" "nwg-look"
prompt_install "Cava (Visualizador de Audio)" "cava" "cava"
prompt_install "MPV (Reproductor de Video)" "mpv" "mpv"

echo -e "\n${BLUE}--- Utilidades Wayland/X11 ---${NC}"
prompt_install "SXHKD (Atajos de teclado X11)" "sxhkd" "sxhkd"
prompt_install "SwayNC (Notificaciones Wayland)" "swaync" "swaync"
prompt_install "Flameshot (Capturas de pantalla)" "flameshot" "flameshot"
prompt_install "Wlogout (Menú de apagado Wayland)" "wlogout" "wlogout"

echo -e "\n${BLUE}=== ¡Instalación Completada! ===${NC}"
echo -e "Es posible que necesites reiniciar tu sesión para que todos los cambios hagan efecto, especialmente tras instalar BSPWM o Hyprland."
