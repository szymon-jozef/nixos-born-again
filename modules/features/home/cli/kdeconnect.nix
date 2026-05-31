{ ... }:
{
  flake.homeModules.programs =
    { ... }:
    {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };
    };
}
