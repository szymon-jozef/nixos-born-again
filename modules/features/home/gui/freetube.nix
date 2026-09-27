{
  flake.homeModules.freetube = {
    programs.freetube.enable = true;
    wayland.windowManager.hyprland.extraConfig =
      # lua
      ''
        -- FreeTube
        hl.bind(mainMod .. " + CONTROL + F", function()
            focus_or_launch("^(freetube)$", "uwsm app -- freetube")
        end)
      '';
  };
}
