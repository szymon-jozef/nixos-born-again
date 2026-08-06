{ ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      programs.btop = {
        enable = true;
        package = pkgs.btop-rocm;
        settings = {
          vim_keys = true;
        };
      };
    };
}
