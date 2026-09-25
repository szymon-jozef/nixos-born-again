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
      (
        { config, ... }:
        {
          system.hostname = hostname;
          monitors.primary = "LVDS-1";

          imports = [
            # general
            self.commonModules.options
            self.nixosModules.general
            self.nixosModules.locale-polish
            self.nixosModules.secrets

            # bootloader
            self.nixosModules.bootloader-mbr

            # packages
            self.nixosModules.packages
            self.nixosModules.programs
            self.nixosModules.hyprland
            self.nixosModules.fish

            # user
            self.nixosModules.user

            # theme
            self.nixosModules.theme

            # services
            self.nixosModules.services-default

            # display manager
            self.nixosModules.display-manager-autologin

            # network
            self.nixosModules.network
            self.nixosModules.network-home-wifi

            # hardware
            self.nixosModules.hardware-pilecki
          ];

          home-manager.users.${config.user.name} = {
            imports = [
              # self.homeModules.* import
              self.homeModules.theme
              self.homeModules.hypr
              self.homeModules.waybar
              self.homeModules.gui-default
              # self.homeModules.terminal-emulator-default
              self.homeModules.kitty

              self.homeModules.cli-default
              self.homeModules.browsers
              self.homeModules.xdg
              self.homeModules.university
              self.homeModules.nixvim
            ];
          };
        }
      )
    ];
  };
}
