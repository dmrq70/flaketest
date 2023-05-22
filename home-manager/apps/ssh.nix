{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "dreyes" = {
        hostname = "dreyes.robin-major.ts.net";
	dynamicForwards = [{port = 9060; }];
      };
    };
  };	       
}
