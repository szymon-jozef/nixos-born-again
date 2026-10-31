{
  imports = [
    ./c.nix
    ./cargo.nix
    ./nix.nix
    ./pylsp.nix
    ./web.nix
  ];

  lsp.completion = {
    enable = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      # script
      lua_ls.enable = true;

      # markdown
      marksman.enable = true;
    };

    keymaps = {
      lspBuf = {
        "<leader>gd" = "definition";
        "<leader>gD" = "references";
        "<leader>gt" = "type_definition";
        "<leader>gi" = "implementation";
        "<leader>ca" = "code_action";
        "<leader>cr" = "rename";
        "K" = "hover";
      };

      extra = [
        {
          action = "<cmd>lua vim.diagnostic.jump({ count=-1, float=true })<CR>";
          key = "<leader>gk";
        }
        {
          action = "<cmd>lua vim.diagnostic.jump({ count=1, float=true })<CR>";
          key = "<leader>gj";
        }
      ];
    };
  };
}
