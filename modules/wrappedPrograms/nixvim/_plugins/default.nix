{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];

  imports = [
    ./telescope.nix
    ./markdown.nix
    ./completion.nix
    ./git.nix
    ./ui.nix
  ];

  plugins = {
    # close () and stuff
    nvim-autopairs.enable = true;

    # surround text with vim motions
    # for example saiw" will *s*urround *a*dd *i*nner *w*ord (with) "
    # I can never remember this anyway
    mini-surround.enable = true;

    # autoformat on save
    lsp-format.enable = true;

    # treesitter speaks for itself
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = false;
      };
    };
    treesitter-textobjects.enable = true;

    # show current indentation level
    indent-blankline.enable = true;

    # restore session
    auto-session.enable = true;

    # show lsp errors
    trouble.enable = true;

    # show dir as nvim buffer
    oil.enable = true;

    # faster navigating
    flash.enable = true;
  };
}
