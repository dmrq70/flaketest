{
  description = "Todo mi sistema";

  inputs = {
    nixkpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
	  modules = [
	    ./nixos/configuration.nix
	    home-manager.nixosModules.home-manager
	    {
              home-manager = {
                 useUserPackages = true;
		 useGlobalPkgs = true;
                 users.diego = ./home-manager/home.nix;
              };
	    }
	  ];
	};
      };
   };
}
  
