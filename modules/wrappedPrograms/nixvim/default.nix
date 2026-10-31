{
  self,
  inputs,
  moduleWithSystem,
  ...
}:
{
  config = {
    perSystem =
      { system, ... }:
      {
        packages.nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
          module = {
            imports = [
              ./_general.nix
              ./_keymaps.nix
              ./_plugins.nix 
              ./_lsp
            ];
          };
        };
      };

    flake.nixosModules.nixvim = moduleWithSystem (
      { system, ... }:
      {
        environment.systemPackages = [
          self.packages.${system}.nvim
        ];

        environment.variables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      }
    );

  };
}
