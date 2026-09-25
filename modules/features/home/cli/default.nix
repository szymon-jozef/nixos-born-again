{ self, ... }:
{
  flake.homeModules.cli-default = {
    imports = [
      self.homeModules.fish # default shell

      self.homeModules.atuin
      self.homeModules.bat
      self.homeModules.btop
      self.homeModules.fastfetch
      self.homeModules.git
      self.homeModules.ssh
      self.homeModules.udiskie
      self.homeModules.yazi
      self.homeModules.zoxide

      self.homeModules.cli-packages
    ];
  };
}
