{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.atuin = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
