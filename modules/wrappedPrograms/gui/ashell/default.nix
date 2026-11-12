{ self, ... }:
{
  flake.wrappers.ashell =
    { pkgs, ... }:
    let
      ashell = import ./_wrapper.nix;
    in
    {
      imports = [ ashell ];

      settings = {
        position = "Bottom";
        modules = {

          left = [
            "Tempo"
            "Workspaces"
          ];
          center = [ "WindowTitle" ];
          right = [
            "Privacy"
            "MediaPlayer"
            "SystemInfo"
            [
              "CustomNotifications"
              "Tray"
              "Settings"
            ]
          ];
        };

        CustomModule = [
          {
            name = "CustomNotifications";
            icon = "";
            command = "${pkgs.writeShellScript "dnd-toggle" ''
              if makoctl mode | grep -q do-not-disturb; then
                makoctl mode -r do-not-disturb > /dev/null
              else
                makoctl mode -a do-not-disturb > /dev/null
              fi
              pkill -USR1 -f dnd-check 
            ''}";
            listen_cmd = "${pkgs.writeShellScript "dnd-check" ''
              print_state() {
                if makoctl mode | grep -q do-not-disturb; then
                  echo '{"alt":"dnd"}'
                else
                  echo '{"alt":"none"}'
                fi
              }

              trap print_state USR1

              print_state

              while true; do
                sleep infinity & wait $!
              done
            ''}";
            icons.dnd = "";
          }
        ];

        tempo = {
          clock_format = "%H:%M | %e.%m ";
        };

        media_player = {
          indicator_format = "Icon";
        };

        settings = {
          remove_airplane_btn = true;
        };

        appearance = import ./_style.nix;
      };
    };

  flake.nixosModules.ashell = { config, lib, ... }: {
    imports = [ self.wrappers.ashell.install ];

    wrappers.ashell = {
      enable = true;
      settings.outputs.Targets = [ config.monitors.primary ];
    };

    systemd.user.services.ashell = {
      description = "Autostart ashell";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = lib.getExe config.wrappers.ashell.wrapper;
        Restart = "on-failure";
      };
    };
  };
}
