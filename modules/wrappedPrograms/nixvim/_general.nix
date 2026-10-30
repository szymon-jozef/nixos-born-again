{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
    autocomplete = true;
  };

  opts = {
    relativenumber = true;
    number = true;

    signcolumn = "yes";

    # highlight current line for cursor
    cursorline = true;

    # better colors
    termguicolors = true;

    wrap = true;
    shiftwidth = 4;
    tabstop = 4;
    expandtab = true;
    list = true;
    clipboard = "unnamed";
    spell = true;
    spelllang = [
      "pl"
      "en"
    ];

    completeopt = [
      "menuone"
      "noselect"
      "popup"
    ];
  };

  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;

    virtual_lines = false;
    underline = false;

    virtual_text = {
      prefix = "●";
      spacing = 4;
      source = "if_many";
      current_line = true;
    };

    float = {
      border = "rounded";
    };

    jump = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };
  };

  colorschemes.catppuccin = {
    enable = true;
    autoLoad = true;
    settings.flavour = "mocha";
  };

  autoGroups.YankHighlight.clear = true;
  autoCmd = [
    {
      event = "TextYankPost";
      group = "YankHighlight";
      callback.__raw = ''
        function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
        end
      '';
    }
  ];
}
