{
  flake.nixosModules.services-printing = {
    services = {
      printing.enable = true;
      # for wireless printing
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
