{ ... }:
{
  flake.modules.homeManager.hyprland =
    {
      pkgs,
      inputs,
      lib,
      ...
    }:

    let
      # terminal = lib.getExe pkgs.kitty;
      terminal = lib.getExe pkgs.ghostty;
      menu = lib.getExe pkgs.hyprlauncher;
      music_player = lib.getExe pkgs.spotify;
      notes = lib.getExe pkgs.obsidian;
      # signal_client = "${terminal} --title 'gurk' ${pkgs.gurk-rs}/bin/gurk";
      signal_client = "${terminal} -e ${pkgs.gurk-rs}/bin/gurk";
      browser = lib.getExe inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
      color = "green";
    in
    {

      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";

        settings = {
          mainMod._var = "SUPER";
          terminal._var = terminal;
          menu._var = menu;
          music_player._var = music_player;
          notes._var = notes;
          signal_client._var = signal_client;
          browser._var = browser;
          openrgb_color._var = color;

          env = [
            {
              _args = [
                "XCURSOR_SIZE"
                "32"
              ];
            }
            {
              _args = [
                "HYPRCURSOR_SIZE"
                "32"
              ];
            }
            {
              _args = [
                "HYPRCURSOR_THEME"
                "theme_phinger-cursors-light"
              ];
            }
            {
              _args = [
                "XDG_CURRENT_DESKTOP"
                "Hyprland"
              ];
            }
          ];
        };
      };
    };
}
