{ ... }:
{
  flake.modules.homeManager.hyprland =
    { pkgs, lib, ... }:
    {
      wayland.windowManager.hyprland.settings = {

        permission = [
          {
            binary = lib.getExe pkgs.hyprlock;
            type = "screencopy";
            mode = "allow";
          }
          {
            binary = lib.getExe pkgs.grim;
            type = "screencopy";
            mode = "allow";
          }
          {
            binary = "${pkgs.xdg-desktop-portal-hyprland}/libexec/.xdg-desktop-portal-hyprland-wrapped";
            type = "screencopy";
            mode = "allow";
          }
        ];
      };
    };
}
