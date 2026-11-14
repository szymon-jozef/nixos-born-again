{ self, ... }:
{
  flake.wrappers.hyprlock = { wlib, ... }: {
    imports = [ wlib.wrapperModules.hyprlock ];

    settings = {
      "$font" = "Monospace";

      general = {
        hide_cursor = false;
      };

      animations = {
        enabled = true;
        bezier = [
          "linear, 1, 1, 0, 0"
        ];
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "$text";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:60000] date +"%A, %d %B %Y"'';
          color = "$subtext1";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      input-field = {
        size = "400, 100";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        rounding = 15;
        outline_thickness = " 4";
        dots_size = " 0.2";
        dots_spacing = " 0.2";
        outer_color = " $accent";
        inner_color = " $surface0";
        font_color = " $text";

        placeholder_text = ''
          Dzień dobry, $USER
        '';

        hide_input = " false";
        check_color = " $accent";
        fail_color = " $red";
        fail_text = " <i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = " $yellow";
        halign = " center";
        valign = " center";

      };
    }
    // (import ./_theme.nix);

  };

  flake.nixosModules.hyprlock = {
    imports = [ self.wrappers.hyprlock.install ];
    wrappers.hyprlock.enable = true;
  };
}
