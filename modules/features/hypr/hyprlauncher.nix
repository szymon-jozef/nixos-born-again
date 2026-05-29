{ ... }:
{
  flake.homeModules.hyprlauncher =
    { ... }:
    {
      services.hyprlauncher = {
        enable = true;

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
    };
}
