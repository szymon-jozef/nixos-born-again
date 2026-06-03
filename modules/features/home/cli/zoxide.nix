{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
