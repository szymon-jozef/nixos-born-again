{ config, ... }:
{
  flake.modules.homeManager.hypr =
    { ... }:
    {
      imports = [
        config.flake.modules.homeManager.hyprland
        config.flake.modules.homeManager.hypridle
        config.flake.modules.homeManager.hyprlauncher
        config.flake.modules.homeManager.hyprlock
        config.flake.modules.homeManager.hyprsunset
        config.flake.modules.homeManager.hyprtoolkit
      ];
    };
}
