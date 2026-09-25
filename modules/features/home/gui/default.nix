{ self, ... }:
{
  flake.homeModules.gui-default = {
    imports = [
      self.homeModules.wallpaper
      self.homeModules.vesktop
      self.homeModules.kdeconnect
      self.homeModules.browsers
      self.homeModules.mako
      self.homeModules.obsidian
      self.homeModules.satty

      self.homeModules.gui-packages

    ];
  };
}
