{ ... }:
{
  flake.nixosModules.services-snapper =
    { myConfig, ... }:
    {
      services.snapper = {
        configs = {
          home = {
            SUBVOLUME = "/home";
            ALLOW_USERS = [ myConfig.username ];
            TIMELINE_CREATE = true;
            TIMELINE_CLEANUP = true;
          };
        };
      };
    };
}
