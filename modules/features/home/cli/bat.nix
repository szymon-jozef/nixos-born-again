{ ... }:
{
  flake.homeModules.cli =
    { ... }:
    {
      programs.bat = {
        enable = true;
      };
    };
}
