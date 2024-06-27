{ config, pkgs, ... }:

{
  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    display = {
      separator = " > ";
    };
    modules = [
      "separator"
      "title"
      "separator"

      "os"
      "kernel"
      "uptime"
      "packages"
      "break"

      "shell"
      "break"

      "de"
      "wm"
      "theme"
      "icons"
      "break"

      "host"
      "cpu"
      "gpu"
      "memory"
      "battery"
      "poweradapter"
      "break"
      {
        type = "colors";
        symbol = "circle";
      }
    ];
  };
}
