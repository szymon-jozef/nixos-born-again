{ ... }:
{
  flake.nixosModules.services =
    { ... }:
    {
      services = {
        hardware.openrgb.enable = false;
        xserver.enable = false;
        fstrim = {
          enable = true;
          interval = "weekly";
        };
        fwupd.enable = true;
      };
    };
}
