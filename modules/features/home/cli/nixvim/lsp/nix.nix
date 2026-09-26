{
  flake.homeModules.nixvim-nix =
    let
      flakePath = "/etc/nixos";
    in
    {
      programs.nixvim.plugins.lsp.servers.nixd = {
        enable = true;
        # autoStart = true;
        filetypes = [ "nix" ];
        settings = {
          formatting = {
            command = [ "nixfmt" ];
          };

          nixpkgs.expr = ''
            import (builtins.getFlake "${flakePath}").inputs.nixpkgs { }
          '';
          options = {
            nixos.expr = ''(builtins.getFlake ("/etc/nixos")).nixosConfigurations.paderewski.options'';
            home_manager.expr = ''(builtins.getFlake ("/etc/nixos")).nixosConfigurations.paderewski.options.home-manager.users.type.getSubOptions [ ]'';
          };
        };
      };
    };
}
