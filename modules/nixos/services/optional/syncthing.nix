{
  flake.nixosModules.services-syncthing =
    { config, ... }:
    {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        systemService = false;
        user = config.user.name;
      };
    };
}
