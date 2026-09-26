{
  flake.homeModules.nixvim-cargo = {
    programs.nixvim.plugins.lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
  };
}
