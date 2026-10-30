{
  keymaps = [
    {
      # unmap space
      mode = [
        "n"
        "v"
      ];
      key = "<Space>";
      action = "<Nop>";
      options.silent = true;
    }

    # shifting code
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

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move selected lines down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move selected lines up";
    }

    # make sure the screen is centered
    {
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

    # splitting windows
    {
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

    # showing diagnostics
    {
      mode = "n";
      key = "<leader>ce";
      action = "<cmd> Trouble diagnostics<CR>";
      options.desc = "Show lsp diagnostics";
    }
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd> Trouble lsp<CR>";
      options.desc = "Show lsp definitions, etc.";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd> AutoSession search<CR>";
      options.desc = "Search sessions";
    }

    # turn off highlight with esc after finding something
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }

    # flash
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options.desc = "Flash jump";
    }
  ];
}
