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
          "networkmanager"
          "wheel"
          "docker"
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
          home = {
            file = {
              "Obrazy/tapety/".source = inputs.wallpapers;
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
