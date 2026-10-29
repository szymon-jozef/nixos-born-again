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

          imports =
            with self.nixosModules;
            [
              general
              locale-polish
              secrets

              bootloader-gpt

              packages
              packages-virtualisation
              university # TODO don't forget to remove this
              programs
              gaming
              hyprland
              fish

              user

              theme

              services
              services-hardware-overclock
              services-syncthing
              services-snapper

              display-manager-autologin

              network

              wrapped-programs-default
            ]
            ++ [
              self.commonModules.options

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
