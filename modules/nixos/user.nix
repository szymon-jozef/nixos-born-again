{ self, inputs, ... }:
{
  flake.nixosModules.user =
    {
      myConfig,
      pkgs,
      pkgs-stable,
      ...
    }:
    {
      users.users.${myConfig.username} = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
        ];
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit
            inputs
            pkgs-stable
            myConfig
            ;
        };

        users.${myConfig.username} = {
          imports = [
            inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
            inputs.catppuccin.homeModules.catppuccin

            # self.modules.homeManager.* import
            self.modules.homeManager.theme
            self.modules.homeManager.hypr
            self.modules.homeManager.ashell
            self.modules.homeManager.gui
            self.modules.homeManager.kitty
            self.modules.homeManager.ghostty

            self.modules.homeManager.cli
            self.modules.homeManager.gemini
            self.modules.homeManager.browsers
            self.modules.homeManager.xdg
            self.modules.homeManager.gaming
            self.modules.homeManager.university
          ];
          home = {
            file = {
              "Obrazy/tapety/catppuccin".source = inputs.wallpapers;
            };

            sessionVariables = {
              EDITOR = "nvim";
              VISUAL = "nvim";
              XDG_DATA_DIRS = "$HOME/.nix-profile/share/applications:$XDG_DATA_DIRS";
            };

            pointerCursor = {
              name = "phinger-cursors-light";
              package = pkgs.phinger-cursors;
              size = 24;
              gtk.enable = true;
              x11.enable = true;
            };

            stateVersion = "25.11"; # DONT CHANGE ME UwU
          };
        };

      };
    };
}
