{ hyprland, pkgs, userSettings, ... }: {
  imports = [
    ./alacritty
    ./dunst
    ./hypr
    ./kitty
    ./rofi
    ./waybar
    ./zsh
  ];
}

