{ self, ... }:
{
  flake.homeModules.gui-default = {
    imports = [
      self.homeModules.wallpaper
      self.homeModules.vesktop
      self.homeModules.kdeconnect
      self.homeModules.browsers
      self.homeModules.udiskie
      self.homeModules.obsidian

      self.homeModules.gui-packages

    ];
  };
}
