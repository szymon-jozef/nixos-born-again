{ ... }:
{
  flake.homeModules.gui =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        # TODO! split into files
        homebank
        gimp
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
