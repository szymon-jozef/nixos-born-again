{ ... }:
{
  flake.nixosModules.user =
    {
      inputs,
      username,
      hostname,
      pkgs,
      pathConfig,
      ...
    }:
    {
      users.users.${username} = {
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
        extraSpecialArgs = {
          inherit
            inputs
            username
            hostname
            pathConfig
            ;
        };

        users.${username} = {
          imports = [
            inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
            # self.homeModules.* import
          ];
          home = {
            file = {
              ${pathConfig.wallpaper}.source = inputs.wallpapers;
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
