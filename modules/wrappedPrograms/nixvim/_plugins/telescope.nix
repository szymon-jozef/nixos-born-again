{
  plugins.telescope = {
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
}
