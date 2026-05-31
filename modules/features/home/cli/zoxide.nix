{ ... }:
{
  flake.homeModules.programs =
    { ... }:
    {
      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
    };
}
