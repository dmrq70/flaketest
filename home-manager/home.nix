{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/git.nix
    ./apps/ssh.nix
  ];
 
  home.username = "diego";
  home.homeDirectory = "/home/diego";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [ 
    httpie 
    lazygit
    duf
    fd
    exa
    bottom
    bat
    ncdu
    tldr
    fzf
    kitty
    ripgrep
    emacs-with-packages
    bat
  ];
  programs.home-manager.enable = true;
}

