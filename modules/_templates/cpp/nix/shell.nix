{
  perSystem =
    { pkgs, config, ... }:
    {
      devenv.shells.default = {
        packages = with pkgs; [
          clang
          clang-tools
          clang-analyzer
          valgrind
          cppcheck
        ];

        env = {
          CMAKE_BUILD_TYPE = "Debug";
        };

        inputsFrom = [
          (config.packages.default)
        ];
      };
    };
}
