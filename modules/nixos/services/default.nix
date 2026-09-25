{ self, ... }:
{
  flake.nixosModules.services-default = {
    imports = [
      self.nixosModules.services-audio
      self.nixosModules.services-printing
      self.nixosModules.services-ssh
      self.nixosModules.services-additional
      self.nixosModules.services-hardware
    ];
  };
}
