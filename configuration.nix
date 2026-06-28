{ config, lib, pkgs, ... }:

{
 imports = [
 	./hardware-configuration.nix
 ];

 # Bootloader
	boot.loader.limine.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

 # Greeter
 services.greetd = {
	enable = true;
	settings = {
		default_session = {
			command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
			user = "kittydclxvi";
		};
	};
 };

 # Use latest kernel.
 boot.kernelPackages = pkgs.linuxPackages_latest;

 # Bluetooth
 hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
 };

 # Use NixOS experimental features
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 # Network
 networking.hostName = "awful-nixos";
 networking.wireless.enable = true;
 networking.networkmanager.enable = true;

 # Time zone
 time.timeZone = "Asia/Yekaterinburg";

 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";

 i18n.extraLocaleSettings = {
	LC_ADDRESS = "ru_RU.UTF-8";
	LC_IDENTIFICATION = "ru_RU.UTF-8";
	LC_MEASUREMENT = "ru_RU.UTF-8";
	LC_MONETARY = "ru_RU.UTF-8";
	LC_NAME = "ru_RU.UTF-8";
	LC_NUMERIC = "ru_RU.UTF-8";
	LC_PAPER = "ru_RU.UTF-8";
	LC_TELEPHONE = "ru_RU.UTF-8";
	LC_TIME = "ru_RU.UTF-8";
 };

 # Fonts
 fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
 ];

 # Configure keymap in X11
 services.xserver.xkb = {
	layout = "us,ru";
	variant = "";
	options = "grp:win_space_toggle";
 };

 # User settings
 users.users."kittydclxvi" = {
 	isNormalUser = true;
	description = "KITTYDCLXVI";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [];
 };

 # Proprietary software
 nixpkgs.config.allowUnfree = true;

 # Installed packages
 environment.systemPackages = with pkgs; [
	tor-browser
	firefox
	vim
	neovim 
	wget
	git
	mako
	wofi
	tuigreet
	keepassxc
	bluez
	bluetui
	nnn
	wl-clipboard
	slurp
	ayugram-desktop
 ];

 # Enable Sway
 programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
 };

 # Firefox configuration
 programs.firefox = {
	enable = true;

	languagePacks = ["en-US" "ru"];
 };

 # System version
 system.stateVersion = "26.05"; # Did you read the comment?

}
