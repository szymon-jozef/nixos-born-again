{
  description = "NixOS born again configuration.";

  inputs = {
    # === NIX ===
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # === CACHYOS KERNEL ===
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    # === OTHER STUFF ===
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-obsidian = {
      url = "github:catppuccin/obsidian";
      flake = false;
    };

    hyprcursor-phinger = {
      url = "github:jappie3/hyprcursor-phinger";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:orangci/walls-catppuccin-mocha";
      flake = false;
    };

    # === UNI ===

    # TODO! add this somewhere
    zut-calendar = {
      url = "github:szymon-jozef/zut-calendar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zutui = {
      url = "github:shv187/zutui";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        imports = [
          (inputs.import-tree ./modules)
        ];

        options.flake.homeModules = lib.mkOption {
          type = lib.types.lazyAttrsOf lib.types.deferredModule;
          default = { };
          description = "Custom homemanager modules";
        };

      }
    );
}
