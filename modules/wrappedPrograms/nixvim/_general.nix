{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  opts = {
    relativenumber = true;
    number = true;
    signcolumn = "yes";
    cursorline = false;
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

  extraConfigLua = ''
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
        source = "if_many",
      }
    });
  '';
}
