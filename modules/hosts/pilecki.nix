{ inputs, self, ... }:
let
  myConfig = {
    username = "szymon";
    hostname = "paderewski";
    email = "szymon_jozef@proton.me";
    system = "x86_64-linux";
    pathConfig = {
      wallpaper = "Obrazy/tapety/catppuccin";
      screenshot = "Obrazy/zrzuty/";
    };
    mainMonitor = "DP-1";
    maxJobs = "auto";
    maxCores = 0;
  };
in
{
  # old thinkpad
  flake.nixosConfigurations.${myConfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        myConfig
        ;
    };

    system = myConfig.system;

    modules = [
      # general
      self.nixosModules.general
      self.nixosModules.locale-polish

      # bootloader
      self.nixosModules.bootloader-gpt

      # packages
      self.nixosModules.packages
      self.nixosModules.packages-virtualisation
      self.nixosModules.gaming
      self.nixosModules.hyprland
      self.nixosModules.cli

      # user
      self.nixosModules.user

      # theme
      self.nixosModules.theme

      # services
      self.nixosModules.services

      # display manager
      self.nixosModules.display-manager-autologin

      # network
      self.nixosModules.network
      self.nixosModules.network-home-wifi

      # hardware
      self.nixosModules.hardware-pilecki
    ];
  };
}
