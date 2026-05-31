{ ... }:
{
  flake.nixosModules.theme =
    { inputs, ... }:
    {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        accent = "sapphire";
      };
    };

  flake.homeModules.theme =
    { ... }:
    {
      gtk = {
        enable = true;
        colorScheme = "dark";
        gtk4.theme = null;
      };

      dconf = {
        enable = true;
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      };
    };
}
