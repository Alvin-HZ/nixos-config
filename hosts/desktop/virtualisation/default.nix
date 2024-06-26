{ config, pkgs, user, userSettings, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ userSettings.username ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
