{
  description = "Cpp project template";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        _module.args.metadata = builtins.fromJSON (builtins.readFile ./metadata.json);

        systems = [
          "x86_64-linux"
          #"aarch64-darwin"
        ];

        imports = [
          (inputs.import-tree ./nix)
        ];
      }
    );
}
