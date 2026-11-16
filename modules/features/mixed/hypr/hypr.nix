{ self, ... }:
{
  flake.homeModules.hypr = {
    imports = [
      self.homeModules.hyprland
      self.homeModules.hyprtoolkit
    ];
  };
}
