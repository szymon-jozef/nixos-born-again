{
  plugins = {
    # show keymaps
    which-key.enable = true;

    # icons
    web-devicons.enable = true;

    # status line
    lualine.enable = true;

    snacks = {
      enable = true;

      settings = {
        indent = {
          # show current indentation level
          enabled = true;
          animate.enabled = false;
        };

        words.enabled = false; # highlight word under cursor. This is annoying, I decided to disable this
        bigfile.enabled = true; # don't load plugins on gigabig files
        rename.enabled = true; # better rename
      };
    };
  };
}
