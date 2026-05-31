{ ... }:
{
  flake.homeModules.cli =
    { ... }:
    {
      programs.atuin = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
