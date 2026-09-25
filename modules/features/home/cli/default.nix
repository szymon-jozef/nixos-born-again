{ self, ... }:
{
  flake.modules.homeManager.cli-default = {
    imports = [
      self.modules.homeManager.fish # default shell

      self.modules.homeManager.atuin
      self.modules.homeManager.bat
      self.modules.homeManager.btop
      self.modules.homeManager.fastfetch
      self.modules.homeManager.git
      self.modules.homeManager.ssh
      self.modules.homeManager.udiskie
      self.modules.homeManager.yazi
      self.modules.homeManager.zoxide

      self.modules.homeManager.packages
    ];
  };
}
