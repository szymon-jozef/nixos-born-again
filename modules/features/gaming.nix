{ ... }:
{
  flake.nioxsModules.gaming =
    { ... }:
    {
      programs = {
        steam = {
          enable = true;
          gamescopeSession = true;
          protontricks.enable = true;
        };
        java.enable = true;
      };
    };

  flake.homeModules.gaming =
    { pkgs, pkgs-stable, ... }:
    {
      home.packages = with pkgs; [
        steam
        mangohud
        prismlauncher
        heroic
        # lutris
        pkgs-stable.rpcs3
        pcsx2
      ];
    };
}
