{ ... }:
{
  flake.nixosModules.programs =
    { ... }:
    {
      programs.direnv.enable = true;
    };
}
