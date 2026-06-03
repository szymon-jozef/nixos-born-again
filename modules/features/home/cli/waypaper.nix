{ ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        waypaper
      ];
    };
}
