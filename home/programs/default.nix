{ hyprland, pkgs, userSettings, ... }: {
  imports = [
    ./wlogout
    ./dunst
    ./hypr
    ./kitty
    ./rofi
    ./waybar
    ./zsh
  ];
}

