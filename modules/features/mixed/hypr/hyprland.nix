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

  flake.modules.homeManager.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        systemd.enable = true;
      };
    };
}
