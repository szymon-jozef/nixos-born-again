{ inputs, self, ... }:
let
  hostname = "pilecki";
in
{
  # old thinkpad
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        ;
    };

    system = "x86_64-linux";

    modules = [
      {
        system.hostname = hostname;
      }

      # general
      self.commonModules.options
      self.nixosModules.general
      self.nixosModules.locale-polish

      # bootloader
      self.nixosModules.bootloader-gpt

      # packages
      self.nixosModules.packages
      self.nixosModules.programs
      self.nixosModules.hyprland
      self.nixosModules.cli

      # user
      self.nixosModules.user

      # theme
      self.nixosModules.theme

      # services
      self.nixosModules.services

      # display manager
      self.nixosModules.display-manager-autologin

      # network
      self.nixosModules.network
      self.nixosModules.network-home-wifi

      # hardware
      self.nixosModules.hardware-pilecki
    ];
  };
}
