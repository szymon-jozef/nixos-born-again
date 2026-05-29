{ self, ... }:
{
  flake.nixosModules = {
    # basics
    bootloader =
      { pkgs, ... }:
      {
        boot = {
          initrd.systemd.enable = true;
          plymouth.enable = true;

          # Enable "Silent boot"
          consoleLogLevel = 3;
          initrd.verbose = false;
          kernelParams = [
            "quiet"
            "udev.log_level=3"
            "systemd.show_status=auto"
          ];

          kernelPackages = pkgs.linuxKernel.packagesFor pkgs.cachyosKernels.linux-cachyos-latest; # we use super-cool cachyos kernel
        };
      };

    # Normal elegant computers
    bootloader-gpt =
      { ... }:
      {
        imports = [ self.nixosModules.bootloader ];

        boot.loader = {
          timeout = 5;

          efi.canTouchEfiVariables = true;

          limine = {
            enable = true;
            efiSupport = true;
            biosSupport = false;
          };
        };
      };

    # Legacy mbr (OLD COMPUTERS)
    bootloader-mbr =
      { ... }:
      {
        imports = [ self.nixosModules.bootloader ];

        boot.loader = {
          timeout = 5;

          efi.canTouchEfiVariables = false;

          limine = {
            enable = true;

            efiSupport = false;
            biosSupport = true;
            biosDevice = "/dev/sda";
          };
        };
      };
  };
}
