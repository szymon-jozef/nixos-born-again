{
  flake.homeModules.nixvim-web = {
    programs.nixvim.plugins.lsp.servers = {
      cssls.enable = true;
      html.enable = true;
      emmet_language_server = {
        enable = true;
        filetypes = [ "html" ];
      };
    };
  };
}
