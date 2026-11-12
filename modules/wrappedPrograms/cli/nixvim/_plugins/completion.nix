{
  plugins.blink-cmp = {
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
}
