{ ... }:
{
  flake.modules.homeManager.gui =
    { ... }:
    {
      services.awww = {
        enable = true;
      };
    };
}
