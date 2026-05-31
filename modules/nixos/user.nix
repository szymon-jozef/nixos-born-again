{ ... }:
{
  flake.nixosModules.user =
    {
      inputs,
      myConfig,
      pkgs,
      self,
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
        password = "123";
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit
            inputs
            myConfig
            ;
        };

        users.${myConfig.username} = {
          imports = [
            inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger

            # self.homeModules.* import
            self.homeModules.theme
            self.homeModules.hypr
            self.homeModules.ashell
            self.homeModules.gui
            self.homeModules.browsers
            self.homeModules.xdg
            self.homeModules.gaming
          ];
          home = {
            file = {
              "${myConfig.pathConfig.wallpaper}".source = inputs.wallpapers;
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
