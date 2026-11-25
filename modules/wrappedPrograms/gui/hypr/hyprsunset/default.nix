{ self, ... }:
{
  flake.wrappers.hyprsunset = {
    imports = [ ./_wrapper.nix ];

    settings = {
      max-gamma = 150;

      profile = [
        {
          time = "6:00";
          identity = true;
        }
        {
          time = "22:30";
          identity = false;
          temperature = 4500;
          gamma = 0.8;
        }
      ];
    };
  };

  flake.nixosModules.hyprsunset = {
    imports = [ self.wrappers.hyprsunset.install ];
    wrappers.hyprsunset.enable = true;
  };
}
