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
      { self, ... }:
      {
        imports = [ self.nixosModule.display-manager ];
        displayManager.sddm.settings.Autologin = {
          Session = "hyprland-uwsm.desktop";
          User = "szymon"; # TODO! change to username variable
        };
      };
  };
}
