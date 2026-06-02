{ ... }:
{
  flake.homeModules.hyprland =
    { lib, pkgs, ... }:
    let
    ashell = lib.getExe pkgs.ashell;
    in
    {
      wayland.windowManager.hyprland.settings = {
        on = [
          {
            _args = 
            [
              "hyprland.start"
              (lib.generators.mkLuaInline ''
                function()
                  hl.exec_cmd("wl-paste --type text --watch cliphist store")
                  hl.exec_cmd("wl-paste --type image --watch cliphist store")
                  hl.exec_cmd("uwsm app -- ${ashell}")
                  hl.exec_cmd("awww-daemon")
                end
              '')
            ];
          }
        ];

      };
    };
}
