{ inputs, self, ... }:
let
  myConfig = {
    username = "szymon";
    hostname = "paderewski";
    system = "x86_64-linux";
    pathConfig = {
      wallpaper = "Obrazy/tapety/catppuccin";
      screenshot = "Obrazy/zrzuty/";
      obsidian = "Dokumenty/obsidian";
    };
    mainMonitor = "DP-1";
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
      self.nixosModules.wrapper
      self.nixosModules.bootloader-gpt

      self.nixosModules.services-hardware-overclock
      self.nixosModules.services-syncthing
      self.nixosModules.services-snapper

      self.nixosModules.display-manager-autologin

      self.nixosModules.network-home-wifi

      # hardware
      self.nixosModule.hardware-paderewski
    ];
  };
}
