{ ... }:
{
  flake.modules.homeManager.gui =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        homebank
        gimp
        feh
        mpv
        libreoffice

        # music
        spotify
        vlc

        # texting
        signal-desktop
        gurk-rs
      ];
    };
}
