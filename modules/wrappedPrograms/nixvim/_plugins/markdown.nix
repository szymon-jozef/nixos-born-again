{ pkgs, ... }:
{
  extraPackages = with pkgs.python3Packages; [
    pylatexenc
  ];

  plugins = {
    render-markdown = {
      enable = true;
      settings.latex = {
        enabled = true;
        converter = "latex2text";
      };
    };

    # render images in markdown
    snacks = {
      enable = true;
      settings.image.enabled = true;
    };

    # paste images
    img-clip = {
      enable = true;
      settings.default = {
        dir_path.__raw =
          # lua
          ''
            function()
              local gh = vim.fs.find(".github", {
                upward = true,
                type = "directory",
                path = vim.fn.expand("%:p:h"),
              })[1]

              if gh then
                return vim.fn.fnamemodify(gh, ":.:gs?\\?/?") .. "/assets"
              end

              return "assets"
            end
          '';
        prompt_for_file_name = false;
      };
    };
  };
}
