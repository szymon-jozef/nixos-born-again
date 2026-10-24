{
  flake.nixosModules.university =
    { inputs, ... }:
    {
      imports = [
        inputs.aruba-via.nixosModules.default
        inputs.battleship.nixosModules.default
      ];

      programs.battleships.enable = true;
      services.aruba-via = {
        enable = true;
        autostart = false;
      };
    };

  flake.homeModules.university =
    {
      inputs,
      pkgs,
      ...
    }:
    let
      rstudio-with-packages = pkgs.rstudioWrapper.override {
        packages = with pkgs.rPackages; [
          # additional packages for rstudio here
          ggplot2
        ];
      };
    in
    {
      home.packages = [
        inputs.zut-calendar.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.zutui.packages.${pkgs.stdenv.hostPlatform.system}.default

        #       rstudio-with-packages
      ];
    };
}
