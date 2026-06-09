{ ... }:
{
  flake.modules.homeManager.hyprland =
    { lib, ... }:
    {
      wayland.windowManager.hyprland.settings = {
        config = {

          general = {
            gaps_in = 2;
            gaps_out = 4;

            border_size = 2;

            "col.active_border" = {
              colors = [
                (lib.generators.mkLuaInline "colors.sapphire")
                (lib.generators.mkLuaInline "colors.red")
              ];
              angle = 60;
            };
            "col.inactive_border" = lib.generators.mkLuaInline "colors.base";

            allow_tearing = false;
            resize_on_border = true;
            layout = "scrolling";
          };

          decoration = {
            rounding = 1;
            rounding_power = 2;

            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
              enabled = true;
              range = 1;
              render_power = 1;
              color = lib.generators.mkLuaInline "colors.overlay0";
            };

            blur = {
              enabled = true;
              size = 1;
              passes = 1;
              vibrancy = 0.169600;
            };
          };

          animations = {
            enabled = true;
          };
        };
      };
    };
}
