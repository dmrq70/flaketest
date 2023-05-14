
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "diego";
    userEmail = "dmrq70@gmail.com";
  };

}
