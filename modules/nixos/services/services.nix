{ ... }:
{
  flake.nixosModules.services =
    { pkgs, ... }:
    {
      # other stuff that i want but don't fit any category
      services = {
        upower.enable = true;
        tailscale.enable = true;
        flatpak.enable = true;

        gnome.gnome-keyring.enable = false;
        dbus.packages = [ pkgs.kdePackages.kwallet ]; # use kwallet instead of gnome-shitring
      };

    };
}
