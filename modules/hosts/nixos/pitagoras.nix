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
      (
        { config, ... }:
        {
          system.hostname = hostname;
          monitors.primary = "eDP-1";

          imports = [
            # general
            self.commonModules.options
            self.nixosModules.general
            self.nixosModules.locale-polish
            self.nixosModules.options

            # bootloader
            self.nixosModules.bootloader-gpt

            # packages
            self.nixosModules.packages
            self.nixosModules.university
            self.nixosModules.packages-virtualisation
            self.nixosModules.gaming

            self.nixosModules.programs
            self.nixosModules.hyprland
            self.nixosModules.fish

            # user
            self.nixosModules.user

            # theme
            self.nixosModules.theme

            # nvidia
            self.nixosModules.nvidia

            # services
            self.nixosModules.services-default
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

          # home-manager imports go here
          home-manager.users.${config.user.name} = {
            imports = [
              # self.homeModules.* import
              self.homeModules.theme
              self.homeModules.hypr
              self.homeModules.ashell
              self.homeModules.gui-default
              self.homeModules.terminal-emulator-default

              self.homeModules.cli-default
              self.homeModules.gemini
              self.homeModules.browsers
              self.homeModules.xdg
              self.homeModules.gaming
              self.homeModules.university
            ];
          };
        }
      )
    ];
  };
}
