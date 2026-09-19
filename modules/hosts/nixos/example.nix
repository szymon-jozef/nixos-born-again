{ inputs, self, ... }:

{
  flake.nixosConfigurations."morbius@example" = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        ;
    };

    system = "x86_64-linux";

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
