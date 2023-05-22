{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";
    escapeTime = 0;
    #repeatTime = 600;

    prefix = "C-space";
    historyLimit = 5000;
    clock24 = true;
    
    
  };
}
