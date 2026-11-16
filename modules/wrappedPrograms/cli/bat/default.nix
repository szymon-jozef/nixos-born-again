{ self, ... }:
{
  flake.wrappers.bat = { wlib, ... }: {
    imports = [ wlib.wrapperModules.bat ];
    settings = {
      theme = "dark";
      theme-dark = "catppuccin-mocha";
    };

    themes = {
      "catppuccin-mocha.tmTheme" = ./catppuccin-mocha.tmTheme;
    };
  };

  flake.nixosModules.bat = {
    imports = [ self.wrappers.bat.install ];
    wrappers.bat.enable = true;
  };
}
