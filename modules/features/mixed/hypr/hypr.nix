{ self, ... }:
{
  flake.homeModules.hypr = {
    imports = [
      self.homeModules.hyprland
      self.homeModules.hyprsunset
      self.homeModules.hyprtoolkit
    ];
  };
}
