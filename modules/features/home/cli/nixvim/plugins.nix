{ ... }:
{

  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.nixvim.plugins = {
        # close () and stuff
        nvim-autopairs.enable = true;
        # icons
        web-devicons.enable = true;

        # show keymaps
        which-key.enable = true;

        # show git stuff (super cool!)
        gitsigns = {
          enable = true;
        };

        # fuzzy find files
        telescope = {
          enable = true;
          keymaps = {
            "<leader>ff" = {
              action = "find_files";
              options.desc = "Telescope find files";
            };
            "<leader>fg" = {
              action = "git_files";
              options.desc = "Telescope find git files";
            };
          };
        };

        # harpoon!
        #harpoon = {
        #  enable = true;
        #  enableTelescope = true;
        #};

        #autoformat on save
        lsp-format.enable = true;
        # snippets enginge
        luasnip.enable = true;

        # treesitter speaks for itself
        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = false;
          };
        };
        treesitter-textobjects.enable = true;

        # debugger
        dap.enable = true;
        dap-ui.enable = true;

        # highlights word under cursor
        cursorline = {
          enable = true;
        };

        # show indent
        #mini-indentscope = {
        #  enable = true;
        #  settings.draw.delay = 0;
        #};
        indent-blankline.enable = true;

        # restore session
        auto-session.enable = true;

        # completion engine
        cmp = {
          enable = true;
          settings = {
            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            sources = [
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              { name = "buffer"; }
            ];
            mapping = {
              "<C-p>" = "cmp.mapping.select_prev_item()";
              "<C-n>" = "cmp.mapping.select_next_item()";
              "<C-y>" = "cmp.mapping.confirm({ select = true })";
              "<C-e>" = "cmp.mapping.abort()";
            };
            window = {
              documentation = {
                border = "rounded";
              };
            };
          };
        };

      };
    };
}
