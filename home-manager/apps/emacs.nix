{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      use-package
      monokai-theme
      magit
      nix-mode
    ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = true;
  };
}
