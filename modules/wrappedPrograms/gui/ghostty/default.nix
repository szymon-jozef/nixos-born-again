{ self, ... }:
{
  flake.wrappers.ghostty =
    { wlib, ... }:
    let
      catppuccin-mocha = "${./catppuccin-mocha}";
    in
    {
      imports = [ wlib.wrapperModules.ghostty ];

      settings = {
        font-size = 12;
        font-family = "Hack Nerd Font";

        language = "pl";

        background-opacity = 0.8;
        background-blur = 30;

        window-padding-x = "4,4";
        window-padding-y = "4,4";

        confirm-close-surface = false;
        gtk-single-instance = false;
        theme = catppuccin-mocha;
      };
    };

  flake.nixosModules.ghostty = { pkgs, ... }: {
    imports = [ self.wrappers.ghostty.install ];
    default-apps.terminal-emulator = self.wrappers.ghostty.wrap { inherit pkgs; };
    wrappers.ghostty.enable = true;
  };
}
