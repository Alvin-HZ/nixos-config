{
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    enableHidpi = false;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}

