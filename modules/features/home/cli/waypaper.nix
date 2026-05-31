{ ... }:
{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        waypaper
      ];
    };
}
