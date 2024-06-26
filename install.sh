#!/usr/bin/env bash

DIR=$(pwd)

read -p "Enter user: " USERNAME

sudo nixos-generate-config --show-hardware-config >$DIR/nixos/hardware-configuration.nix

sed -i "s/\"me\"/\"${USERNAME}\"/" $DIR/flake.nix
sed -i "s%\"/home/me/.dotfiles\"%\"${DIR}\"%" $DIR/flake.nix

$EDITOR $DIR/flake.nix

sudo nixos-rebuild switch --flake . --show-trace
