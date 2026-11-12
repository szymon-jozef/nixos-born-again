{ self, ... }:
{
  flake.wrappers.fastfetch = { wlib, ... }: {
    imports = [ wlib.wrapperModules.fastfetch ];
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "packages"
        "separator"
        "wm"
        "shell"
        "terminal"
        "theme"
        "font"
        "locale"
        "separator"
        "display"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "battery"
        "separator"
        "wifi"
        "localip"
        "break"
        "colors"
      ];
    };
  };

  flake.wrappers.fastfetch-smol = { wlib, ... }: {
    imports = [ wlib.wrapperModules.fastfetch ];
    binName = "fastfetch-smol";

    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          bottom = 1;
        };
      };
      display = {
        separator = " ➜ ";
      };
      modules = [
        "title"
        "kernel"
        "packages"
        "shell"
        "battery"
        {
          type = "separator";
          string = " • ";
        }
        "break"
        "break"
        "break"
      ];
    };
  };

  flake.nixosModules.fastfetch = { pkgs, ... }: {
    environment.systemPackages = [
      (self.wrappers.fastfetch.wrap { inherit pkgs; })
      (self.wrappers.fastfetch-smol.wrap { inherit pkgs; })
    ];
  };
}
