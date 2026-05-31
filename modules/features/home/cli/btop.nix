{ ... }:
{
  flake.homeModules.cli =
    { ... }:
    {
      programs.btop = {
        enable = true;
        settings = {
          vim_keys = true;
        };
      };
    };
}
