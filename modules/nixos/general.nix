{ ... }:
{
  flake.nixosModules = {
    general =
      { inputs, ... }:
      {
        imports = [
          inputs.home-manager.nixosModules.home-manager

          inputs.agenix.nixosModules.default

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

        # TODO move this to other module? not sure tho
        # random stuff that probably belong somewhere else
        security = {
          pam = {
            services.sddm.kwallet.enable = true;
            services.login.kwallet.enable = true;
          };
          polkit.enable = true;
          rtkit.enable = true;
        };

        hardware = {
          graphics.enable = true;
          bluetooth.enable = true;
        };

        zramSwap.enable = true;

        system.stateVersion = "25.11";
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
