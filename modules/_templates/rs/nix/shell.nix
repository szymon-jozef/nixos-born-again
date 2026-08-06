{
  perSystem = { pkgs, config, ... }: {
    devenv.shells.default = {
      packages = with pkgs; [ ];

      languages.rust.enable = true;

      inputsFrom = [
        (config.packages.default)
      ];
    };
  };
}
