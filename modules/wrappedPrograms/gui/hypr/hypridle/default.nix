{ self, ... }:
{
  flake.wrappers.hypridle = { wlib, ... }: {
    imports = [ wlib.wrapperModules.hypridle ];

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300; # 5 min
          on-timeout = "hyprlock";
        }
        {
          timeout = 330; # 5.5 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        # {
        #   timeout = 330; # 5.5 min
        #   on-timeout = "openrgb -c black";
        #   on-resume = "openrgb -c green";
        # }
      ];
    };
  };

  flake.nixosModules.hypridle = {
    imports = [ self.wrappers.hypridle.install ];

    wrappers.hypridle.enable = true;
  };
}
