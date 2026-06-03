{ inputs, self, ... }:
let
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
            myConfig
            pkgs-stable
            ;
        };

        modules = [
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

              # self.modules.homeManager.* import
              self.modules.homeManager.theme
              self.modules.homeManager.hypr
              self.modules.homeManager.ashell
              self.modules.homeManager.gui
              self.modules.homeManager.cli
              self.modules.homeManager.browsers
              self.modules.homeManager.xdg
              self.modules.homeManager.gaming
              self.modules.homeManager.university
            ];
          }
        ];
      };
}
