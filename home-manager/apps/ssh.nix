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
      "metricas" = {
        hostname =  "pvi115-metricas";
        user =  "root";
        proxyJump =  "dreyes";
        identityFile =  "~/.ssh/id_ed25519-bbva";
        localForward =  "3000 76.252.94.55:3000";
      }; 
      "gitlab.motorc.com.ar" = {
        port =  2022;
      };
      
      "beacon" = {
        user =  "ubuntu";
        hostname =  "beacon.robin-major.ts.net";
        identityFile =  "~/.ssh/ssh-key-beacon.key";
      };  

      "ipacs" = {
        user =  "administrador";
        hostname =  "10.20.0.7";
        dynamicForwards = [{port= "9060";}];  
      };
    };	       
};
