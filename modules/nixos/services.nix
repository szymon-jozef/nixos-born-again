{
  flake.nixosModules.services = { pkgs, ... }: {
    services = {
      # === audio ===
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      # === printing ===
      printing.enable = true;

      # for wireless printing
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      # === additional ===
      upower.enable = true;
      tailscale.enable = true;
      flatpak.enable = true;

      gnome.gnome-keyring.enable = false;
      dbus.packages = [ pkgs.kdePackages.kwallet ]; # use kwallet instead of gnome-shitring

      # === hardware ===
      hardware.openrgb.enable = false; # turned off, because it destroys my mouse
      xserver.enable = false;

      # ssd trimming
      fstrim = {
        enable = true;
        interval = "weekly";
      };

      fwupd.enable = true; # firmware updates
    };
  };
}
