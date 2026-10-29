{ self, ... }: {
  flake.nixosModules.wrapped-programs-default = {
    imports = [
      self.nixosModules.nh
      self.nixosModules.btop
    ];
  };
}
