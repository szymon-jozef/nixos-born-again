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

        # music
        spotify
        vlc

        # texting
        signal-desktop
        gurk-rs
      ];
    };
}
