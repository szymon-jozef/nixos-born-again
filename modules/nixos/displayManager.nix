{ ... }:
{
  flake.nixosModules = {
    display-manager =
      { ... }:
      {
        displayManager = {
          sddm = {
            enable = true;
            wayland.enable = true;
            autoNumlock = true;
          };
        };
      };

    display-manager-autologin =
      { self, myConfig, ... }:
      {
        imports = [ self.nixosModules.display-manager ];
        displayManager.sddm.settings.Autologin = {
          Session = "hyprland-uwsm.desktop";
          User = myConfig.username;
        };
      };
  };
}
