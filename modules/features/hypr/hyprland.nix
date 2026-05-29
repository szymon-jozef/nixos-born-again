{ ... }:
{
  flake.nixosModules.hyprland =
    { ... }:
    {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        # TODO! split this into flake-part so you can have unstable? not sure tho
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # portalPackage =
        #  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };

  flake.homeModules.hyprland =
    { ... }:
    {
      imports = [
        ./_hyprland
      ];
    };
}
