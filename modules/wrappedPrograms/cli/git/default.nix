{ self, ... }:
{
  flake.wrappers.git =
    { wlib, pkgs, ... }:
    let
      delta = pkgs.lib.getExe (self.wrappers.delta.wrap { inherit pkgs; });
    in
    {
      imports = [ wlib.wrapperModules.git ];

      settings = {
        init.defaultBranch = "master";
        push.autoSetupRemote = true;

        pull.rebase = false;

        merge.tool = "nvimdiff";
        mergetool = {
          prompt = false;
          keepBackup = false;
        };

        core.pager = delta;

        interactive = {
          diffFilter = "${delta} --color-only";
        };

        tag.gpgSign = true;
        gpg.format = "ssh";

        core.excludesFile = "${pkgs.writeText "gitignore" ''
          *~
          *.swp
          .DS_Store
          node_modules
          result
          __pycache__
          .direnv
        ''}";
      };
    };

  flake.nixosModules.git = { config, pkgs, ... }: {
    imports = [ self.wrappers.git.install ];
    wrappers.git =
      let
        pub-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxyiqawA95AlLjXGd99sQCVR2rDq2/D7PG/vz7sZv5G";
      in
      {
        enable = true;
        settings = {
          user = {
            name = config.user.name;
            email = config.user.email;
            signingKey = config.age.secrets.git.path;
          };

          gpg.ssh.allowedSignersFile = toString (
            pkgs.writeText "allowed_signers" ''
              ${config.user.email} ${pub-key}
            ''
          );

          commit.gpgSign = true;
        };
      };

    environment.systemPackages = with pkgs; [
      gh
      git-graph
    ];
  };
}
