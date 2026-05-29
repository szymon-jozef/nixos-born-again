{ inputs, self, ... }:
let
  username = "szymon";
  hostname = "paderewski";
  system = "x86_64-linux";
  pathConfig = {
    wallpaper = "Obrazy/tapety/catppuccin";
    screenshot = "Obrazy/zrzuty/";
    obsidian = "Dokumenty/obsidian";
  };
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        username
        hostname
        pathConfig
        ;
    };

    system = system;

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
