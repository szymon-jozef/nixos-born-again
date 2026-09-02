{
  perSystem = { pkgs, config, ... }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        clippy
        rustfmt
      ];

      inputsFrom = [
        (config.packages.default)
      ];
    };
  };
}
