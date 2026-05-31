{ ... }:
{
  flake.homeModules.packages-gui =
    {
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
      home.packages = with pkgs; [ # TODO! split into files
        homebank
        gimp
        rstudio-with-packages

        feh

        # music
        spotify
        vlc

        # texting
        vesktop
        signal-desktop
        gurk-rs
      ];
    };
}
