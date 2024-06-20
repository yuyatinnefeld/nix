# This shell defines a dev environment for yuyatinnefeld
{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/4fe8d07066f6ea82cda2b0c9ae7aee59b2d241b3.tar.gz";
    sha256 = "sha256:06jzngg5jm1f81sc4xfskvvgjy5bblz51xpl788mnps1wrkykfhp";
  }) {}
}:
pkgs.mkShell rec {
   buildInputs = with pkgs; [
    ###### general ######
    curl
    wget
    jq
    tmux
    inetutils # telnet

    ###### container ######
    colima
    docker
    docker-compose
   ];
}