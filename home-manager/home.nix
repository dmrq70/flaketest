{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/git.nix
  ];
 
  home.username = "diego";
  home.homeDirectory = "/home/diego";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [ 
    httpie 
    lazygit
  ];
  programs.home-manager.enable = true;
}

