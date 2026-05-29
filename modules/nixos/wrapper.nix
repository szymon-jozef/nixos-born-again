{ ... }:
{
  flake.nixosModules.wrapper =
    { self, ... }:
    {
      imports = [
        self.nixosModules.general
        self.nixosModules.locale-polish
        self.nixosModules.services
        self.nixosModules.theme
      ];
    };
}
