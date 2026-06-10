{ ... }:
{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      programs = {
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          protontricks.enable = true;
          extraCompatPackages = [
            pkgs.proton-ge-bin
          ];
        };

        gamemode = {
          enable = true;
        };

        java.enable = true;
      };
    };

  flake.modules.homeManager.gaming =
    { pkgs, pkgs-stable, ... }:
    {
      home.packages = with pkgs; [
        steam
        mangohud
        prismlauncher
        heroic
        lutris
        # pkgs-stable.rpcs3 | commented out since shit doesn't work rn
        pcsx2
      ];
    };
}
