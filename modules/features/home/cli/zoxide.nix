{ ... }:
{
  flake.homeModules.cli =
    { ... }:
    {
      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
