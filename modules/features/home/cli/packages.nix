{ ... }:
{

  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      # TODO clean this up
      home.packages = with pkgs; [
        libnotify
        cliphist

        gh

        trash-cli
        pandoc
        fzf
        eza
        fastfetch
        fd
        duf
        gdu
        jq
        tealdeer
        grim
        slurp
        bc

        nh
        runc
        nixfmt
        nix-output-monitor
      ];
    };
}
