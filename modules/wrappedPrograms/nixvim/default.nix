{ self, inputs, ... }:
{
  config = {
    perSystem = { system, ... }: {
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

    flake.nixosModules.nixvim = { pkgs, ... }: {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
      ];

      environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };

  };
}
