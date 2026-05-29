{ inputs, self, ... }:
let
  username = "john";
  hostname = "pc";
  system = "x86_64-linux";
  pathConfig = {
    wallpaper = "Obrazy/tapety/catppuccin";
    screenshot = "Obrazy/zrzuty/";
    obsidian = "Dokumenty/obsidian";
  };
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        username
        hostname
        pathConfig
        ;
    };

    system = system;

    imports = [
      self.nixosModules.wrapper

      # hardware
      # self.nixosModule.hardware-pc | remember to import hardware configuration!
    ];
  };
}
