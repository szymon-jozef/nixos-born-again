{ inputs, self, ... }:
let
  myConfig = {
    username = "john";
    hostname = "example";
    email = "john@example.com";
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
  flake.nixosConfigurations.${myConfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        myConfig
        ;
    };

    system = myConfig.system;

    imports = [
      # general
      self.nixosModules.general
      self.nixosModules.locale-polish

      # bootloader
      self.nixosModules.bootloader-gpt

      # packages
      self.nixosModules.packages

      # user
      self.nixosModules.user

      # theme
      self.nixosModules.theme

      # services
      self.nixosModules.services

      # display manager
      self.nixosModules.display-manager

      # network
      self.nixosModules.network

      # hardware
      # self.nixosModules.hardware-example
    ];
  };
}
