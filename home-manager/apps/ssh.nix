{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "dreyes" = {
        hostname = "dreyes.robin-major.ts.net";
	dinamicForward = 9060;
      };
    };
  };	       
}