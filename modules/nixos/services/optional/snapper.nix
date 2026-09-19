{ ... }:
{
  flake.nixosModules.services-snapper =
    { config, ... }:
    {
      services.snapper = {
        configs = {
          home = {
            SUBVOLUME = "/home";
            ALLOW_USERS = [ config.user.name ];
            TIMELINE_CREATE = true;
            TIMELINE_CLEANUP = true;
          };
        };
      };
    };
}
