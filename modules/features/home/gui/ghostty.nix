{
  flake.modules.homeManager.ghostty =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
        systemd = { };
        enableFishIntegration = true;
        settings = {
          font-size = 12;
          font-family = "Hack Nerd Font";

          language = "pl";

          background-opacity = 0.8;
          background-blur = 30;

          window-padding-x = "4,4";
          window-padding-y = "4,4";

          confirm-close-surface = false;
          gtk-single-instance = false;
        };
      };
    };
}
