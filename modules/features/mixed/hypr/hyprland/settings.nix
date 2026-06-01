{ ... }:
{
  flake.homeModules.hyprland =
    {
      pkgs,
      inputs,
      ...
    }:

    let
      exe = pkg: "${pkgs.${pkg}}/bin/${pkg}";

      terminal = exe "kitty";
      menu = exe "hyprlauncher";
      music_player = exe "music_player";
      notes = exe "obsidian";
      signal_client = "${terminal} --title 'gurk' ${pkgs.gurk-rs}/bin/gurk";
      browser = "${inputs.zen-browser.packages.${pkgs.stenv.hostPlatform.system}.default}";
      color = "green";
    in
    {

      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";

        settings = {
          mod._var = "SUPER";
          terminal._var = terminal;
          menu._var = menu;
          music_player._var = music_player;
          notes._var = notes;
          signal_client._var = signal_client;
          browser._var = browser;
          openrgb_color._ = color;

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
