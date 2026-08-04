{
  perSystem = { pkgs, config, ... }: {
    devenv.shells.default = {
      packages = with pkgs; [ ];

      inputsFrom = [
        (config.packages.default)
      ];
    };
  };
}
