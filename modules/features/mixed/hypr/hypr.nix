{ self, ... }:
{
  flake.homeModules.hypr = {
    imports = [
      self.homeModules.hyprland
      self.homeModules.hypridle
      self.homeModules.hyprlauncher
      self.homeModules.hyprlock
      self.homeModules.hyprsunset
      self.homeModules.hyprtoolkit
    ];
  };
}
