{ ... }:
{
  flake.nixosModules = {
    general =
      { inputs, ... }:
      {
        imports = [
          inputs.home-manager.flakeModules.home-manager

          inputs.agenix.nixosModules.default

          inputs.catppuccin.nixosModules.catppuccin # TODO move this to theme.nix?

          inputs.nix-index-database.nixosModules.default
          { programs.nix-index-database.comma.enable = true; }

        ];

        nix = {
          settings = {
            substituters = [
              # Cache NixOS
              "https://cache.nixos.org"

              # Cache Kernel CachyOS
              "https://cache.garnix.io"
              "https://attic.xuyh0120.win/lantian"

              # Cache Hyprland
              #  "https://hyprland.cachix.org"
            ];
            trusted-substituters = [ "https://hyprland.cachix.org" ];
            trusted-public-keys = [
              #  NixOS
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

              # Kernel
              "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
              "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc"

              # Hyprland
              #  "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            ];
            experimental-features = [
              "nix-command"
              "flakes"
            ];
            auto-optimise-store = true;
          };
          gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
          };
        };

        nixpkgs = {
          config = {
            allowUnfree = true;
          };
          overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
        };
      };

    general-low-jobs =
      { self, ... }:
      {
        imports = [ self.nixosModules.general ];
        nix.settings = {
          max-jobs = 2;
          cores = 2;
        };
      };
  };
}
