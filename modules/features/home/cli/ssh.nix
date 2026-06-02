{ ... }:
{
  flake.homeModules.cli =
    { myConfig, ... }:
    {

      services.ssh-agent.enable = true;

      programs.ssh = {
        enableDefaultConfig = false;
        enable = true;

        settings = {
          "dmowski" = {
            hostname = "192.168.0.30";
            user = myConfig.username;
            port = 22;
            identityFile = "~/.ssh/dmowski";
          };

          "aur.archlinux.org" = {
            user = myConfig.username;
            identityFile = "~/.ssh/aur";
          };

          "github.com" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/github";
          };

          "*" = {
            addKeysToAgent = "yes";
            setEnv = "TERM=xterm-256color";
          };
        };
      };

    };
}
