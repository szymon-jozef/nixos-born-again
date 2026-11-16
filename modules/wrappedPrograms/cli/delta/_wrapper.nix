# TODO! Verify if this module works correctly and if it does, commit to nix-wrapper-modules. Later tho, I need to get some sleep
{
  pkgs,
  wlib,
  lib,
  config,
  ...
}:
let
  primitive = lib.types.oneOf [
    lib.types.str
    lib.types.bool
    lib.types.int
  ];
in
{
  imports = [ wlib.modules.default ];

  options = {
    settings = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.attrsOf (lib.types.either primitive (lib.types.attrsOf primitive))
      );
      default = { };
      example = {
        delta = {
          navigate = true;
          line-numbers = true;
        };
      };

      description = ''
        Delta configuration options.
      '';

    };
  };

  config = {
    flags."--config" = config.constructFiles.generatedConfig.path;
    constructFiles.generatedConfig = {
      content = lib.generators.toGitINI config.settings;
      relPath = "${config.binName}-config.gitconfig";
    };

    package = lib.mkDefault pkgs.delta;
  };
}
