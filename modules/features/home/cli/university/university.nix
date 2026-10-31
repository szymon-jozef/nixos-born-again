{
  flake.nixosModules.university =
    { inputs, ... }:
    {
      imports = [
        inputs.aruba-via.nixosModules.default
      ];
      services.aruba-via = {
        enable = true;
        autostart = false;
      };
    };

  flake.homeModules.university = {
    services.remmina.enable = true;
  };
}
