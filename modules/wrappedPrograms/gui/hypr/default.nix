{ self, ... }:
{
  flake.nixosModules.hypr = {
    imports = with self.nixosModules; [
      hypridle
      hyprlock
    ];
  };
}
