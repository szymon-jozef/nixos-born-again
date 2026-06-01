{ ... }:
{
  flake.nixosModules.hyprland =
    { ... }:
    {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
      };
    };

  flake.homeModules.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        systemd.enable = true;
      };
    };
}
