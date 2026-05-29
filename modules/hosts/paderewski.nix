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

    modules = [
      self.nixosModules.general
      self.nixosModules.locale-polish
      self.nixosModules.bootloader-gpt
      self.nixosModules.services
      self.nixosModules.services-hardware-overclock
      self.nixosModules.display-manager-autologin

      # hardware
      self.nixosModule.hardware-paderewski
    ];
  };
}
