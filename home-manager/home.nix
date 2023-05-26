{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/git.nix
    ./apps/ssh.nix
    ./apps/tmux.nix
  ];
 
  home.username = "diego";
  home.homeDirectory = "/home/diego";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    tmux
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
    bat
    wezterm
    mpv
    ranger
    bottom
    htop
  ];
  programs.firefox.enable = true;
  programs.home-manager.enable = true;
}

