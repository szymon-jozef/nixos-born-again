{ ... }:
{
  flake.modules.homeManager.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland.settings = {
        # main monitor
        monitor = [
          {
            output = "DP-1";
            mode = "2560x1440@180.06";
            position = "0x0";
            scale = 1;
            # bitdepth = 10;
            vrr = 1;
            cm = "hdr";
            supports_hdr = 1;
            sdrbrightness = 1.6;
            sdrsaturation = 0.98;
            sdr_min_luminance = 0.005;
            sdr_max_luminance = 220;
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
