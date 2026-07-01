{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.nixvim.keymaps = [
        {
          mode = [
            "n"
            "v"
          ];
          key = "<Space>";
          action = "<Nop>";
          options.silent = true;
        }
        {
          mode = "x";
          key = ">";
          action = ">gv";
          options.desc = "Shift code right";
        }
        {
          mode = "x";
          key = "<";
          action = "<gv";
          options.desc = "Shift code left";
        }
        # harpoon
        {
          mode = "n";
          key = "<leader>a";
          action.__raw = "function() require('harpoon'):list():add() end";
          options.desc = "Add file to harpoon";
        }
        {
          mode = "n";
          key = "<C-e>";
          action.__raw = "function() require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{}) end";
          options.desc = "Open harpoon window";
        }
        {
          mode = "n";
          key = "<C-h>";
          action.__raw = "function() require('harpoon'):list():select(1) end";
        }
        {
          mode = "n";
          key = "<C-j>";
          action.__raw = "function() require('harpoon'):list():select(2) end";
        }
        {
          mode = "n";
          key = "<C-k>";
          action.__raw = "function() require('harpoon'):list():select(3) end";
        }
        {
          mode = "n";
          key = "<C-l>";
          action.__raw = "function() require('harpoon'):list():select(4) end";
        }
        {
          mode = "n";
          key = "<C-S-P>";
          action.__raw = "function() require('harpoon'):list():prev() end";
          options.desc = "Toggle previous harpoon buffer";
        }
        {
          mode = "n";
          key = "<C-S-N>";
          action.__raw = "function() require('harpoon'):list():next() end";
          options.desc = "Toggle next harpoon buffer";
        }
        {
          # make sure the screen is centered
          key = "j";
          action = "jzz";
        }
        {
          key = "k";
          action = "kzz";
        }
        {
          key = "[[";
          action = "[[zz";
        }
        {
          key = "]]";
          action = "]]zz";
        }
        {
          key = "{{";
          action = "{{zz";
        }
        {
          key = "}}";
          action = "}}zz";
        }
        # clipboard
        {
          mode = [
            "v"
          ];
          key = "<leader>y";
          action = "\"+y";
          options.desc = "Copy to system clipboard";
        }
        {
          mode = [
            "n"
          ];
          key = "<leader>p";
          action = "\"+p";
          options.desc = "Paste from system clipboard";
        }
        {
          # dap
          mode = "n";
          key = "<F5>";
          action = "<cmd>lua require('dap').continue()<CR>";
          options.desc = "DAP: Start/Continue";
        }
        {
          mode = "n";
          key = "<F10>";
          action = "<cmd>lua require('dap').step_over()<CR>";
          options.desc = "DAP: Step Over";
        }
        {
          mode = "n";
          key = "<F11>";
          action = "<cmd>lua require('dap').step_into()<CR>";
          options.desc = "DAP: Step Into";
        }
        {
          mode = "n";
          key = "<F12>";
          action = "<cmd>lua require('dap').step_out()<CR>";
          options.desc = "DAP: Step Out";
        }
        {
          mode = "n";
          key = "<leader>b";
          action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
          options.desc = "DAP: Toggle Breakpoint";
        }
        {
          mode = "n";
          key = "<leader>du";
          action = "<cmd>lua require('dapui').toggle()<CR>";
          options.desc = "DAP: Toggle UI";
        }
        {
          # splitting windows
          mode = "n";
          key = "<C-h>";
          action = "<C-w>h";
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w>j";
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w>k";
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w>l";
        }
      ];
    };
}
