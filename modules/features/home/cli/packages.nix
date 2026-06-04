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
        zathura
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
        wget
        vim
        git
        ripgrep

        nh
        runc
        nixfmt
        nix-output-monitor
      ];
    };
}
