{ self, ... }: {
  flake.modules.homeManager.terminal-emulator-default = {
    imports = [
      self.modules.homeManager.ghostty
    ];
  };
}
