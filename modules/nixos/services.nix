{ ... }:
{
  flake.nixosModules.services-printing =
    { ... }:
    {
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

  flake.nixosModules.services-ssh =
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

  flake.nixosModules.services-hardware =
    { ... }:
    {
      services = {
        hardware.openrgb.enable = true;
        xserver.enable = false;
        fstrim = {
          enable = true;
          interval = "weekly";
        };
        fwupd.enable = true;
      };
    };

  flake.nixosModules.services-audio =
    { ... }:
    {
      services = {
        pulseaudio.enable = false;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
      };
    };

  flake.nixosModules.services =
    { self, pkgs, ... }:
    {

      imports = [
        self.nixosModules.services-printing
        self.nixosModules.services-ssh
        self.nixosModules.services-hardware
        self.nixosModules.services-audio
      ];

      # other stuff that i want but don't fit any category
      services = {
        upower.enable = true;
        tailscale.enable = true;
        flatpak.enable = true;

        gnome.gnome-keyring.enable = false;
        dbus.packages = [ pkgs.kdePackages.kwallet ]; # use kwallet instead of gnome-shitring
      };

    };

  # === OPTIONAL ===

  flake.nixosModules.services-hardware-overclock =
    { ... }:
    {
      hardware.amdgpu.overdrive.enable = true;
      services.lact.enable = true;
    };

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
