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
      home.packages = with pkgs; [
        homebank
        gimp
        rstudio-with-packages
        feh
        spotify
        vesktop
        signal-desktop
      ];
    };

  flake.homeModules.packages-cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        libnotify
        cliphist
        gh
        trash-cli
        pandoc
        fzf
        eza
        fastfetch
        fd
        duf
        gdu
        jq
        tealdeer
        grim
        slurp
        bc
        nh
        runc
        nixfmt
      ];
    };

  flake.homeModules.packages =
    { self, ... }:
    {
      imports = [
        self.homeModules.packages-cli
        self.homeModules.packages-gui
      ];
    };
}
