set -g fish_greeting ""
if status is-interactive
	# Commands to run in interactive sessions can go here
	fastfetch

end


thefuck --alias | source
atuin start 2>/dev/null
starship init fish | source

# ~/.config/fish/config.fish

# Cargar nix-daemon.sh si existe
if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
end
# Configurar NIX_PATH para Arch
set -x NIX_PATH nixpkgs=https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-23.05.tar.gz




# Created by `pipx` on 2026-02-09 17:35:27
set PATH $PATH /home/jcast/.local/bin
