{ ... }:
{

  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.nixvim.plugins = {
        nvim-autopairs.enable = true;
        web-devicons.enable = true;

        which-key = {
          enable = true;
          settings.spec = [
            {
              __unkeyed-1 = "<leader>?";
              mode = "n";
              desc = "Buffer Local Keymaps (which-key)";
            }
          ];
        };

        gitsigns = {
          enable = true;
        };

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

        harpoon = {
          enable = true;
          enableTelescope = true;
        };

        lsp-format.enable = true;

        luasnip.enable = true;

        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = false;
          };
        };
        treesitter-textobjects.enable = true;

        dap.enable = true;
        dap-ui.enable = true;

        cursorline = {
          enable = true;
        };

        mini-indentscope = {
          enable = true;
          settings.draw.delay = 0;
        };

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
