{
  flake.nixosModules.services-ssh = {
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
