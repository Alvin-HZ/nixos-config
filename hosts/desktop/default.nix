{ config, lib, pkgs, ... }:
{
  imports = [
    ./fonts
    ./virtualisation
    ./services
    ./programs
  ];
  programs.dconf.enable = true;
}
