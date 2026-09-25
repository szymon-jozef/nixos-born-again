{ self, ... }:
{
  flake.modules.homeManager.gui-default = {
    imports = [
      self.modules.homeManager.wallpaper
      self.modules.homeManager.vesktop
      self.modules.homeManager.kdeconnect
      self.modules.homeManager.browsers
      self.modules.homeManager.mako
      self.modules.homeManager.obsidian
      self.modules.homeManager.satty

      self.modules.homeManager.gui-packages

    ];
  };
}
