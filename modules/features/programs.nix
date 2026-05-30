{ ... }:
{
  flake.nixosModules.programs =
    { ... }:
    # TODO! split this
    {
      programs = {
        kdeconnect.enable = true;

        gnupg.agent.enable = true;
        obs-studio.enable = true;

        direnv.enable = true;
      };
    };
}
