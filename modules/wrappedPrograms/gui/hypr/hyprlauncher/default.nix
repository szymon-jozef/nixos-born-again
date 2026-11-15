{ self, ... }:
let
  hyprlauncher = import ./_wrapper.nix;
in
{
  flake.wrappers.hyprlauncher = {
    imports = [ hyprlauncher ];

    settings = {
      cache.enabled = true;

      finders = {
        desktop_icons = true;
        desktop_launch_prefix = "uwsm app --";
      };

      general = {
        grab_focus = true;
      };
    };
  };

  flake.nixosModules.hyprlauncher = {
    imports = [ self.wrappers.hyprlauncher.install ];
    wrappers.hyprlauncher.enable = true;
  };
}
