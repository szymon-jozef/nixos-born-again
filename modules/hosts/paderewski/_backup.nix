{ pkgs, config, ... }:
let

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
  systemd.timers."drives-backup" = {
    description = "Daily backup of drives";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  systemd.services."drives-backup" = {
    description = "Backup drives";
    startAt = "daily";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = backup;
      User = config.user.name;
    };
  };

}
