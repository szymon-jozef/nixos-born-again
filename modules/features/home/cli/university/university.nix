{ ... }:
{
  flake.homeModules.university =
    { inputs, pkgs, ... }:
    {
      home.packages = [
        inputs.zut-calendar.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.zutui.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
