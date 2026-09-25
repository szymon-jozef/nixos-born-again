{ inputs, self, ... }:
let
  # just a helper
  myConfig = {
    username = "jozef";
    hostname = "example";
    email = "john@idk.com";
    system = "x86_64-linux";
    mainMonitor = "DP-1";
  };

  pkgs = import inputs.nixpkgs {
    system = myConfig.system;
    config.allowUnfree = true;
  };

  pkgs-stable = import inputs.nixpkgs-stable {
    system = myConfig.system;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-38.8.4"
      ];
    };
  };
in
{
  flake.homeConfigurations."${myConfig.username}@${myConfig.hostname}" =
    inputs.home-manager.lib.homeManagerConfiguration
      {
        inherit pkgs;
        extraSpecialArgs = {
          inherit
            self
            inputs
            pkgs-stable
            ;
        };

        modules = [
          {
            user.name = myConfig.username;
            user.email = myConfig.email;

            system.hostname = myConfig.hostname;
            monitors.primary = myConfig.mainMonitor;
          }

          {
            home = {
              username = myConfig.username;
              homeDirectory = "/home/${myConfig.username}";
              stateVersion = "25.11";
            };
            targets.genericLinux.enable = true;

            imports = [
              inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
              inputs.catppuccin.homeModules.catppuccin

              # self.homeModules.* import
              self.homeModules.theme
              self.homeModules.hypr
              self.homeModules.ashell
              self.homeModules.gui
              self.homeModules.cli
              self.homeModules.browsers
              self.homeModules.xdg
              self.homeModules.gaming
              self.homeModules.university
            ];
          }
        ];
      };
}
