{ inputs, self, ... }:
let
  myConfig = {
    username = "szymon";
    hostname = "pitagoras";
    email = "szymon_jozef@proton.me";
    system = "x86_64-linux";
    mainMonitor = "eDP-1";
    maxJobs = 2;
    maxCores = 2;
  };
in
{
  # lenovo legion
  flake.nixosConfigurations.${myConfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        myConfig
        ;
    };

    system = myConfig.system;

    modules = [
      # general
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
