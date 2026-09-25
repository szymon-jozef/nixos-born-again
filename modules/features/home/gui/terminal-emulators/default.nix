{ self, ... }: {
  flake.homeModules.terminal-emulator-default = {
    imports = [
      self.homeModules.ghostty
    ];
  };
}
