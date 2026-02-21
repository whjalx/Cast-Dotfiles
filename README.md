# 🌟 Cast Dotfiles

¡Bienvenido a mi repositorio de *dotfiles* (archivos de configuración)! Este repositorio provee configuraciones estéticas, modernas y altamente funcionales para entornos Wayland y X11.

Actualmente soporta dos configuraciones de escritorio principales:
- **[Hyprland]** (Wayland) - Para una experiencia moderna y con animaciones fluidas.
- **[BSPWM]** (X11) - Para un flujo de trabajo minimalista basado en el uso de teclado.

## 📦 Componentes Incluidos

Dependiendo del entorno de escritorio que uses, puedes combinar las siguientes herramientas incluidas:

### 🖥️ Gestores de Ventanas (Window Managers)
- **Wayland:** [Hyprland](https://hyprland.org/), usa `hyprpaper` (para el fondo) e `hyprlock` (para la pantalla de bloqueo).
- **X11:** [BSPWM](https://github.com/baskerville/bspwm)

### 🚀 Lanzadores y Barras de Tareas
- **Barras:** [Waybar](https://github.com/Alexays/Waybar) (para Hyprland) / [Polybar](https://github.com/polybar/polybar) (para BSPWM) / [Eww](https://elkowar.github.io/eww/) (Widgets)
- **Lanzadores:** [Rofi](https://github.com/davatorium/rofi) / [Wofi](https://hg.sr.ht/~scoopta/wofi)

### 💻 Terminal y Shell
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** [Fish](https://fishshell.com/)
- **Prompt:** [Starship](https://starship.rs/)

### 🛡️ Utilidades Core
- **Editor:** [Neovim](https://neovim.io/)
- **Archivos:** [Ranger](https://github.com/ranger/ranger) / [Broot](https://dystroy.org/broot/)
- **Sistema:** [Btop](https://github.com/aristocratos/btop) / [Htop](https://htop.dev/) / [Fastfetch](https://github.com/fastfetch-cli/fastfetch) / [Neofetch](https://github.com/dylanaraps/neofetch)
- **Historial CLI:** [Atuin](https://github.com/atuinsh/atuin)

### 🎨 Personalización y Media
- **Colores:** [Pywal](https://github.com/dylanaraps/pywal)
- **Visualizador de Audio:** [Cava](https://github.com/karlstav/cava)
- **Apariencia GTK:** [NWG-Look](https://github.com/nwg-piotr/nwg-look)
- **Video:** [MPV](https://mpv.io/)

### ⚙️ Otras Herramientas y Daemons
- **Atajos Teclado (X11):** [SXHKD](https://github.com/baskerville/sxhkd)
- **Notificaciones (Wayland):** [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- **Apagado (Wayland):** [Wlogout](https://github.com/ArtsyMacaw/wlogout)
- **Capturas:** [Flameshot](https://flameshot.org/)

> **Nota:** La mayoría de configuraciones están pensadas para instalaciones base como Arch Linux (con gestores de dependencias como `yay` o `pacman`).

---

## 🚀 Instalación Automática Interactiva (Recomendado)

El repositorio cuenta con un instalador en bash interactivo y modular. Ejecútalo para elegir qué partes deseas instalar y configurar en tiempo real.

```bash
git clone https://github.com/whjalx/cast-dotfiles.git ~/repos/cast-dotfiles
cd ~/repos/cast-dotfiles
chmod +x install.sh
./install.sh
```

El script hará lo siguiente para cada componente:
1. Te preguntará si deseas instalarlo o saltártelo (Ej: `"¿Deseas instalar y configurar Kitty? (s/n)"`).
2. Descargará las dependencias de dicho programa utilizando `yay` (o `pacman`).
3. Respaldará tus configuraciones existentes creando una copia `.bak`.
4. Creará un **enlace simbólico** a tu carpeta real `~/.config`, manteniéndolos siempre sincronizados con tus últimos "commits".

## 🔄 Cómo mantener sincronizado (sync_dots)

Para simplificar guardar cambios localmente en este directorio para subirlos a GitHub, puedes correr:
```bash
./sync_dots.sh
```
Esto copiará recursivamente los cambios locales (`~/.config/...`) hacia `~/repos/cast-dotfiles` y automáticamente realizará un *commit y push* a tu rama `main`.

## 📌 Instalación Manual

Si prefieres añadir los dotfiles a tu carpeta de configuraciones de forma manual, puedes hacerlo enlazándolos individualmente:
```bash
ln -s ~/repos/cast-dotfiles/kitty ~/.config/kitty
ln -s ~/repos/cast-dotfiles/bspwm ~/.config/bspwm
ln -s ~/repos/cast-dotfiles/polybar ~/.config/polybar
# Repite este proceso para otras aplicaciones que utilices...
```
