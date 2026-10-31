{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];

  plugins = {
    # close () and stuff
    nvim-autopairs.enable = true;
    # icons
    web-devicons.enable = true;

    # show keymaps
    which-key.enable = true;

    # show git stuff (super cool!)
    gitsigns.enable = true;

    mini-git.enable = true;
    mini-surround.enable = true;
    mini-ai.enable = true;

    # fuzzy find files
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Telescope find files";
        };
        "<leader>fg" = {
          action = "git_files";
          options.desc = "Telescope find git files";
        };

        "<leader>fw" = {
          action = "live_grep";
          options.desc = "Telescope find word";
        };

        "<leader>fs" = {
          action = "grep_string";
          options.desc = "Telescope find current string";
        };

        "<leader>f." = {
          action = "resume";
          options.desc = "Resume telescope buffer";
        };

        "<leader>fd" = {
          action = "diagnostics";
          options.desc = "Find diagnostics";
        };

        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Find help tags";
        };
      };
    };

    #autoformat on save
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

    # highlights word under cursor
    cursorline = {
      enable = true;
    };

    indent-blankline.enable = true;

    # status line
    lualine.enable = true;

    # restore session
    auto-session.enable = true;

    # show lsp errors
    trouble.enable = true;

    # show dir as nvim buffer
    oil.enable = true;

    # faster navigating
    flash.enable = true;

    # completion engine
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";

        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];

        completion = {
          menu = {
            auto_show = false;
            border = "rounded";
          };

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            window.border = "rounded";
          };
        };

        signature = {
          enabled = true;
          window.border = "rounded";
        };
      };
    };
  };
}
