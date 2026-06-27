{ config, pkgs, ...}:

{
 home.username = "kittydclxvi";
 home.homeDirectory = "/home/kittydclxvi";
 home.stateVersion = "26.05";
 programs.bash = {
	enable = true;
	shellAliases = {
		meow = "echo I love cats!";
	};
 };
}
