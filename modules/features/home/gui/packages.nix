{ ... }:
{
  flake.homeModules.gui =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
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
