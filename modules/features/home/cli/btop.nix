{ ... }:
{
  flake.modules.homeManager.cli =
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
