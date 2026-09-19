{ inputs, self, ... }:
let
hostname = "pitagoras";
in
{
  # lenovo legion
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
        monitors.primary = "eDP-1";
    }

      # general
      self.nixosModules.options
      self.nixosModules.general
      self.nixosModules.locale-polish

      # bootloader
      self.nixosModules.bootloader-gpt

      # packages
      self.nixosModules.packages
      self.nixosModules.university
      self.nixosModules.packages-virtualisation
      self.nixosModules.gaming

      self.nixosModules.programs
      self.nixosModules.hyprland
      self.nixosModules.cli

      # user
      self.nixosModules.user

      # theme
      self.nixosModules.theme

      # nvidia
      self.nixosModules.nvidia

      # services
      self.nixosModules.services
      self.nixosModules.services-syncthing
      self.nixosModules.services-snapper

      # display manager
      self.nixosModules.display-manager-autologin

      # network
      self.nixosModules.network
      self.nixosModules.network-home-wifi

      # hardware
      self.nixosModules.hardware-pitagoras
    ];
  };
}
