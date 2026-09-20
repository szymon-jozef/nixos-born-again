{
  flake.nixosModules = {
    display-manager = {
      services.displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          autoNumlock = true;
        };
      };
    };

    display-manager-autologin =
      {
        self,
        config,
        ...
      }:
      {
        imports = [ self.nixosModules.display-manager ];
        /*
          services.displayManager.sddm.settings.Autologin = {
            Session = "hyprland-uwsm.desktop";
            User = myConfig.username;
          };
        */
        services.displayManager = {
          defaultSession = "hyprland";

          autoLogin = {
            enable = true;
            user = config.user.name;
          };
        };
      };
  };
}
