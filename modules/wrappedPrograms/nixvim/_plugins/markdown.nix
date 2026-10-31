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
        dir_path = "assets";
        prompt_for_file_name = false;
      };
    };
  };
}
