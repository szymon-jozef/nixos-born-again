{ inputs, self, ... }:
let
  username = "szymon";
  hostname = "paderewski";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        username
        hostname
        ;
    };

    system = system;

    imports = [
      self.nixosModules.wrapper

      self.nixosModules.services-hardware-overclock
      self.nixosModules.services-syncthing
      self.nixosModules.services-snapper

      self.nixosModules.display-manager-autologin

      # hardware
      self.nixosModule.hardware-paderewski
    ];
  };
}
