{ inputs, self, ... }:
let
  hostname = "paderewski";
in
{
  # main pc desktop
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit
        self
        inputs
        ;
    };

    modules = [
      (
        # backup services
        { lib, config, ... }:
        {
          system.hostname = hostname;

          imports = [
            # general
            self.commonModules.options
            self.nixosModules.general
            self.nixosModules.locale-polish
            self.nixosModules.secrets

            inputs.fwm.nixosModules.default

            # bootloader
            self.nixosModules.bootloader-gpt

            # packages
            self.nixosModules.packages
            self.nixosModules.packages-virtualisation
            self.nixosModules.university # TODO don't forget to remove this
            self.nixosModules.programs
            self.nixosModules.gaming
            self.nixosModules.hyprland
            self.nixosModules.fish

            # user
            self.nixosModules.user

            # theme
            self.nixosModules.theme

            # services
            self.nixosModules.services-default
            self.nixosModules.services-hardware-overclock
            self.nixosModules.services-syncthing
            self.nixosModules.services-snapper

            # display manager
            self.nixosModules.display-manager-autologin

            # network
            self.nixosModules.network
            self.nixosModules.network-home-wifi

            # custom
            ./_hardware.nix
            ./_backup.nix
          ];

          # home-manager imports go here
          home-manager.users.${config.user.name} = {
            imports = [
              # self.homeModules.* import
              self.homeModules.theme
              self.homeModules.hypr
              self.homeModules.ashell

              self.homeModules.gui-default
              self.homeModules.freetube
              self.homeModules.terminal-emulator-default

              self.homeModules.xdg
              self.homeModules.gaming
              self.homeModules.university

              self.homeModules.cli-default
              self.homeModules.nixvim
              self.homeModules.gemini
            ];

            # start this apps only on this host
            wayland.windowManager.hyprland.settings = {
              on = [
                {
                  _args = [
                    "hyprland.start"
                    (lib.generators.mkLuaInline ''
                      function()
                          hl.exec_cmd("vesktop")
                          hl.exec_cmd(signal_client, {workspace = 1} )
                          hl.exec_cmd(browser)
                      end
                    '')
                  ];
                }
              ];
            };
          };
        }
      )
    ];
  };
}
