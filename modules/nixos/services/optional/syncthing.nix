{ ... }:
{
  flake.nixosModules.services-syncthing =
    { myConfig, ... }:
    {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        systemService = false;
        user = myConfig.username;
      };
    };
}
