{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];

  imports = [
    ./telescope.nix
    ./markdown.nix
    ./completion.nix
    ./git.nix
    ./ui.nix
  ];

  plugins = {
    # close () and stuff
    nvim-autopairs.enable = true;

    # surround text with vim motions
    # for example saiw" will *s*urround *a*dd *i*nner *w*ord (with) "
    # I can never remember this anyway
    mini-surround.enable = true;

    # autoformat on save
    lsp-format.enable = true;

    # treesitter speaks for itself
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = false;
      };
    };
    treesitter-textobjects.enable = true;

    # restore session
    auto-session = {
      enable = true;

      settings = {
        suppressed_dirs = [
          "~/"
          "~/Kodowanie"
          "~/Pobrane"
          "~/Dokumenty"
        ];

        git_use_branch_name = true;
        purge_after_minutes = (60 * 12 * 7); # week
      };

    };

    # show lsp errors
    trouble.enable = true;

    # show dir as nvim buffer
    oil.enable = true;

    # faster navigating
    flash.enable = true;
  };

  autoCmd = [
    # lsp rename files changes with Oil
    {
      event = "User";
      pattern = "OilActionsPost";
      callback.__raw = ''
        function(event)
          if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
          end
        end
      '';
    }
  ];
}
