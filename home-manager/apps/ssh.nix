{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "dreyes" = {
        hostname = "dreyes.robin-major.ts.net";
	dynamicForwards = [{ port = 9060; }];
      };
      "dreyes-ovpn" = {
        hostname= "10.20.0.3";
        dynamicForwards = [{ port = 9060 ; }];
      };
      "tecinf4" = {
        hostname = "tecinf4";
	user = "root";
	proxyJump= "dreyes";
	identityFile = "~/.ssh/id_rsa-bbva";
      };
      "tecinf" = {
        hostname = "tecinf";
	user = "root";
	proxyJump= "dreyes";
	identityFile = "~/.ssh/id_rsa-bbva";
      };

    };
  };	       
}
