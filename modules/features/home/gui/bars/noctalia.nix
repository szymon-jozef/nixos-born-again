{ ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.noctalia-shell ];
      xdg.configFile."noctalia/settings.json".source = ./noctalia.json;

      systemd.user.services.noctalia-shell = {
        Unit.Description = "Enable noctalia-shell";
        Install.WantedBy = [ "graphical-session.target" ];
        Service = {
          ExecStart = "${pkgs.lib.getExe pkgs.noctalia-shell}";
        };
      };
    };
}
