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

      self.nixosModules.services
      self.nixosModules.services-hardware-overclock
      self.nixosModules.services-syncthing
      self.nixosModules.services-snapper

      self.nixosModules.display-manager-autologin

      self.nixosModules.network-home-wifi

      # hardware
      self.nixosModules.hardware-paderewski
    ];
  };
}
