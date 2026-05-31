{ ... }:
{
  flake.homeModules.cli =
    { ... }:
    {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };
    };
}
