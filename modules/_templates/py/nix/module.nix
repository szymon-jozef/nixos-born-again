{ metadata, ... }:
{
  flake.nixosModules.default =
    {
      self,
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.programs.${metadata.project.name};

      inherit (lib)
        mkEnableOption
        mkOption
        mkIf
        ;

      inherit (pkgs.stdenv.hostPlatform) system;
    in
    {

      options.programs.${metadata.project.name} = {
        enable = mkEnableOption metadata.project.name;

        package = mkOption {
          default = self.packages.${system}.default;
          description = "Package to use";
          type = lib.types.package;
        };
      };

      config = mkIf cfg.enable {
        environment.systemPackages = [ cfg.package ];
      };
    };
}
