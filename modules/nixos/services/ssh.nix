{ ... }:
{
  flake.nixosModules.services =
    { ... }:
    {
      services = {
        openssh = {
          enable = true;
          openFirewall = false;
          settings = {
            PasswordAuthentication = false;
          };
        };
      };
    };
}
