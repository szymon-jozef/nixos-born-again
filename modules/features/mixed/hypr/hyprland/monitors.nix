{ ... }:
{
  flake.homeModules.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland.settings = {
        # main monitor
        monitor = [
          {
            output = "DP-1";
            mode = "2560x1440@180";
            position = "0x0";
            scale = 1;
            bitdepth = 10;
            cm = "hdr";
            supports_hdr = true;
            sdrbrightness = 1.6;
            sdrsaturation = 0.98;
          }
          # secondary monitor
          {
            output = "DP-2";
            mode = "1920x1080@144";
            position = "auto-left";
            scale = 1;
          }

          # tv
          {
            output = "HDMI-A-2";
            mode = "highres";
            position = "auto-up";
            scale = 1;
          }

          # laptop
          {
            output = "dDP-1";
            mode = "1920x1080@144";
            position = "0x0";
            scale = 1;
          }

          # default
          {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = "auto";
          }
        ];
      };
    };
}
