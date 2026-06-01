{ ... }:
{
  flake.homeModules.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland.settings = {
        config = {
          dwindle = {
            preserve_split = true;
          };

          master = {
            new_status = "slave";
            orientation = "left";
            allow_small_split = true;
          };

          scrolling = {
            fullscreen_on_one_column = true;
          };

          misc = {
            force_default_wallpaper = 0;
            disable_hyprland_logo = true;
          };

          input = {
            follow_mouse = 1;

            kb_layout = "pl";
            kb_model = "";
            kb_options = "caps:escape_shifted_capslock";
            kb_rules = "";
            kb_variant = "";
            left_handed = false;
            sensitivity = 0;

            touchpad = {
              natural_scroll = true;
            };
          };
        };

        ecosystem = {
          enforce_permissions = true;
        };

        xwayland = {
          force_zero_scaling = true;
        };
      };
    };
}
