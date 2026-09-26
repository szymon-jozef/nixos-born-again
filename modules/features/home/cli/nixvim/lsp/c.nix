{
  flake.homeModules.nixvim-c = {
    programs.nixvim.plugins.lsp.servers = {
      clangd.enable = true;
      cmake.enable = true;
    };
  };
}
