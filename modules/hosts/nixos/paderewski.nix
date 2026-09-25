{ inputs, self, ... }:
let
  hostname = "paderewski";

  pkgs = import inputs.nixpkgs {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  getExe = pkgs.lib.getExe;

  # drives backup
  backup =
    pkgs.writeShellScript "backup"
      # bash
      ''
        set -e
        echo "=== Starting drives backup ==="

        echo "Backup to uwu"
        ${getExe pkgs.rsync} -avh --no-links --delete --exclude=.* --exclude=dyski /home/szymon/ /mnt/uwu_backup/home/szymon/
        echo "Backup to wd"
        ${getExe pkgs.rsync} -avh --no-links --delete --exclude=.* --exclude=dyski /home/szymon/ /mnt/wd_backup/home/szymon/
      '';
in
{
  # main pc desktop
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit
        self
        inputs
        ;
    };

    modules = [
      (
        # backup services
        { lib, config, ... }:
        {
          systemd.timers."drives-backup" = {
            description = "Daily backup of drives";
            wantedBy = [ "timers.target" ];
            timerConfig = {
              OnCalendar = "daily";
              Persistent = true;
            };
          };

          system.hostname = hostname;

          systemd.services."drives-backup" = {
            description = "Backup drives";
            startAt = "daily";
            serviceConfig = {
              Type = "oneshot";
              ExecStart = backup;
              User = config.user.name;
            };
          };

          imports = [
            # general
            self.commonModules.options
            self.nixosModules.general
            self.nixosModules.locale-polish

            inputs.fwm.nixosModules.default

            # bootloader
            self.nixosModules.bootloader-gpt

            # packages
            self.nixosModules.packages
            self.nixosModules.packages-virtualisation
            self.nixosModules.university # TODO don't forget to remove this
            self.nixosModules.programs
            self.nixosModules.gaming
            self.nixosModules.hyprland
            self.nixosModules.cli

            # user
            self.nixosModules.user

            # theme
            self.nixosModules.theme

            # services
            self.nixosModules.services
            self.nixosModules.services-hardware-overclock
            self.nixosModules.services-syncthing
            self.nixosModules.services-snapper

            # display manager
            self.nixosModules.display-manager-autologin

            # network
            self.nixosModules.network
            self.nixosModules.network-home-wifi

            # hardware
            self.nixosModules.hardware-paderewski
          ];

          # home-manager imports go here
          home-manager.users.${config.user.name} = {
            imports = [
              # self.modules.homeManager.* import
              self.modules.homeManager.theme
              self.modules.homeManager.hypr
              self.modules.homeManager.ashell
              self.modules.homeManager.gui
              self.modules.homeManager.ghostty

              self.modules.homeManager.cli-default
              self.modules.homeManager.nixvim
              self.modules.homeManager.gemini
              self.modules.homeManager.browsers
              self.modules.homeManager.xdg
              self.modules.homeManager.gaming
              self.modules.homeManager.university
            ];

            # start this apps only on this host
            wayland.windowManager.hyprland.settings = {
              on = [
                {
                  _args = [
                    "hyprland.start"
                    (lib.generators.mkLuaInline ''
                      function()
                          hl.exec_cmd("vesktop")
                          hl.exec_cmd(signal_client, {workspace = 1} )
                          hl.exec_cmd(browser)
                      end
                    '')
                  ];
                }
              ];
            };
          };
        }
      )
    ];
  };
}
