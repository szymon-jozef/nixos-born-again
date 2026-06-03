{ ... }:
{
  flake.homeModules.university =
    {
      inputs,
      pkgs,
      pkgs-stable,
      ...
    }:
    let
      rstudio-with-packages = pkgs-stable.rstudioWrapper.override {
        # we use stable, because unstable is broken rn
        packages = with pkgs-stable.rPackages; [
          # additional packages for rstudio here
          ggplot2
        ];
      };
    in
    {
      home.packages = [
        inputs.zut-calendar.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.zutui.packages.${pkgs.stdenv.hostPlatform.system}.default
        rstudio-with-packages
      ];
    };
}
