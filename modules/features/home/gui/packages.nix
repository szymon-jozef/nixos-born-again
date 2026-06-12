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

        hunspell
        hunspellDicts.pl_PL
        hyphenDicts.pl_PL

        # music
        spotify
        vlc

        # texting
        signal-desktop
        gurk-rs
      ];
    };
}
