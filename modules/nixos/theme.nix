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
}
