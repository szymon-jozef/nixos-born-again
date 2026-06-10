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

        # music
        spotify
        vlc

        # texting
        signal-desktop
        gurk-rs
      ];
    };
}
