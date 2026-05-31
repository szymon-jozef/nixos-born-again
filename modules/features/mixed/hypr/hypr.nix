{ config, ... }:
{
  flake.homeModules.hypr =
    { ... }:
    {
      imports = [
        config.flake.homeModules.hyprland
        config.flake.homeModules.hypridle
        config.flake.homeModules.hyprlauncher
        config.flake.homeModules.hyprlock
        config.flake.homeModules.hyprsunset
        config.flake.homeModules.hyprtoolkit
      ];
    };
}
