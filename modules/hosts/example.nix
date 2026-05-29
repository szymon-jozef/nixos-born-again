{ inputs, self, ... }:
let
  myConfig = {
    username = "john";
    hostname = "example";
    system = "x86_64-linux";
    pathConfig = {
      wallpaper = "Obrazy/tapety/catppuccin";
      screenshot = "Obrazy/zrzuty/";
      obsidian = "Dokumenty/obsidian";
    };
    mainMonitor = "DP-1";
  };
in
{
  flake.nixosConfigurations.${myConfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        myConfig
        ;
    };

    system = myConfig.system;

    imports = [
      self.nixosModules.wrapper

      # hardware
      # self.nixosModule.hardware-pc | remember to import hardware configuration!
    ];
  };
}
