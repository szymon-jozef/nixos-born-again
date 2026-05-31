{ ... }:
{
  flake.homeModules.programs =
    { ... }:
    {
      programs.atuin = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
