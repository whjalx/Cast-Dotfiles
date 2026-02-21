# 🌟 Cast Dotfiles

Welcome to my dotfiles repository! This configuration provides a modern, aesthetic, and highly functional setup centered around **Hyprland** (Wayland window manager).

## 📦 Requirements

To get the full experience, the following base packages are recommended:
- **Window Manager:** [Hyprland](https://hyprland.org/), `hyprpaper`, `hyprlock`
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** [Fish](https://fishshell.com/)
- **Editor:** [Neovim](https://neovim.io/)
- **Bars & Widgets:** [Waybar](https://github.com/Alexays/Waybar), [Eww](https://elkowar.github.io/eww/)
- **App Launchers:** [Rofi](https://github.com/davatorium/rofi) / [Wofi](https://hg.sr.ht/~scoopta/wofi)
- **Colors:** [Pywal](https://github.com/dylanaraps/pywal)
- **System Monitors:** [Btop](https://github.com/aristocratos/btop), [Htop](https://htop.dev/)
- **CLI Utilities:** [Broot](https://dystroy.org/broot/), [Atuin](https://github.com/atuinsh/atuin)
- **Audio Visualizer:** [Cava](https://github.com/karlstav/cava)

> **Note:** These configurations are primarily built and tested on Arch Linux. If you are on a different distribution, ensure package names correspond to your distro's package manager.

## 🚀 Installation

This repository includes a convenient, semi-automatic interactive installation script. 

### Interactive Script (Recommended)

Run the script to choose exactly which components to configure and install:

```bash
git clone https://github.com/whjalx/cast-dotfiles.git ~/repos/cast-dotfiles
cd ~/repos/cast-dotfiles
chmod +x install.sh
./install.sh
```

The script will walk you through each available component:
1. Ask if you want to setup the component (`y/n`).
2. Automatically attempt to install dependencies using `yay` or `pacman`.
3. Backup your existing configurations to `~/.config/<app>.bak`.
4. Create symbolic links from this repo to your `~/.config/<app>` folder.

### Manual Installation

If you prefer to manually link specific directories rather than using the script, you can simply create a symlink from the repository to your `~/.config` directory:

```bash
ln -s ~/repos/cast-dotfiles/kitty ~/.config/kitty
ln -s ~/repos/cast-dotfiles/hypr ~/.config/hypr
# Repeat for other applications...
```
