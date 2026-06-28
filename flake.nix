{
 description = "A very awful flake";

 inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
 };

 outputs = { nixpkgs, home-manager, ... }: {
	nixosConfigurations.awful-nixos = nixpkgs.lib.nixosSystem {
		modules = [ 
			./configuration.nix
			home-manager.nixosModules.home-manager
			{
				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					users.kittydclxvi = import ./home.nix;
				};
			}
		];
	};
 };
}
