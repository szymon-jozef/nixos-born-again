{ self, ... }:
{
  flake.homeModules.browsers = {
    imports = [
      self.homeModules.zen
      self.homeModules.web-apps
    ];
  };
}
