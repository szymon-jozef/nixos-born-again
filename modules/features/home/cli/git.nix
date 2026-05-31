{ ... }:
{
  flake.homeModules.programs =
    { pkgs, myConfig, ... }:
    let
      signingKey = "~/.ssh/github.pub";
    in
    {

      home.packages = with pkgs; [
        git-graph
      ];

      programs.git = {
        enable = true;
        settings = {
          user = {
            name = myConfig.username;
            email = myConfig.email;
          };
          init.defaultBranch = "master";
          push.autoSetupRemote = true;

          gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";

          pull.rebase = false;

          merge.tool = "nvimdiff";
          mergetool.prompt = false;
          mergetool.keepBackup = false;
        };

        signing = {
          key = signingKey;
          signByDefault = true;
          format = "ssh";
        };

        ignores = [
          "*~"
          "*.swp"
          ".DS_Store"
          "node_modules"
          "result"
          "__pycache__"
          ".direnv"
        ];

      };

      programs.gh = {
        enable = true;
        settings.git_protocol = "ssh";
      };

      home.file.".ssh/allowed_signers".text = ''
        ${myConfig.email} ${signingKey}
      '';

      programs.delta = {
        enable = true;
        enableGitIntegration = true;
      };

      services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-curses;
      };
    };
}
