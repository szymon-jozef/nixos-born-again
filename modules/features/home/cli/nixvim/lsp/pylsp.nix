{
  flake.homeModules.nixvim-pylsp = {
    programs.nixvim.plugins.lsp.servers.pylsp = {
      enable = true;
      settings = {
        plugins = {
          ruff = {
            enabled = true;
            format = [ "I" ];
          };

          pylsp_mypy.enabled = true;

          jedi_completion.enabled = true;
          jedi_definition.enabled = true;
        };
      };
    };
  };
}
