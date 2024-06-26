{ pkgs, userSettings, ... }: {

  imports = [
    #./environment
    ./programs
    ./scripts
    ./themes
  ];
  nixpkgs.config.allowUnfree = true;

  home = {
    username = userSettings.username;
    homeDirectory = "/home/${userSettings.username}";
  };

  home.packages = (with pkgs; [

    #User Apps
    brave

    #utils
    ranger
    wlr-randr
    git
    rustup
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol
    sqlite

    #misc 
    cava
    neovim
    nano
    rofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    eza
    btop
    tokyo-night-gtk
    gedit

  ]) ++ (with pkgs.gnome; [
    nautilus
    zenity
    gnome-tweaks
    eog
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
