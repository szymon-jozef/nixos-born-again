{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    let
      flakePath = "/etc/nixos";
    in
    {

      programs.nixvim.plugins.lsp = {
        enable = true;
        servers = {
          # script
          lua_ls.enable = true;
          # web
          cssls.enable = true;
          html.enable = true;
          emmet_language_server = {
            enable = true;
            filetypes = [ "html" ];
          };

          # friendly-snippets.enable = true;
          # dev
          clangd.enable = true;
          cmake.enable = true;

          pylsp = {
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
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          # nix
          nixd = {
            enable = true;
            # autoStart = true;
            filetypes = [ "nix" ];
            settings = {
              formatting = {
                command = [ "nixfmt" ];
              };

              # TODO change names to myConfig
              nixpkgs.expr = ''
                import (builtins.getFlake "${flakePath}").inputs.nixpkgs { }
              '';
              options = {
                nixos.expr = ''(builtins.getFlake ("/etc/nixos")).nixosConfigurations.paderewski.options'';
                home_manager.expr = ''(builtins.getFlake ("/etc/nixos")).nixosConfigurations.paderewski.options.home-manager.users.type.getSubOptions [ ]'';
              };
            };
          };
          # other
          marksman.enable = true;
        };
        keymaps = {
          lspBuf = {
            "<leader>ca" = "code_action";
            "<leader>r" = "rename";
          };
        };
      };
    };
}
