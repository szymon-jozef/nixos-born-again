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
      home.file.".config/hypr/hyprland.lua" = {
        source = ./_hyprland/hyprland.lua;
      };

      home.file.".config/hypr/catppuccin.lua" = {
        source = ./_hyprland/catppuccin.lua;
      };
    };
}
