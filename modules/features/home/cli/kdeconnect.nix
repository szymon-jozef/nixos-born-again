{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };
    };
}
