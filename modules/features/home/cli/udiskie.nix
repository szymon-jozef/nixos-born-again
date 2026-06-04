{ ... }:
{
  flake.modules.homeManager.cli =
    { ... }:
    {
      services.udiskie = {
        enable = true;
        automount = true;
        notify = true;
      };
    };
}
