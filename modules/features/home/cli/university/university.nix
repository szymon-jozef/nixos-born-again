{
  flake.nixosModules.university =
    { inputs, ... }:
    {
      imports = [
        inputs.aruba-via.nixosModules.default
        inputs.battleship.nixosModules.default
      ];

      programs.battleships.enable = true;
      services.aruba-via = {
        enable = true;
        autostart = false;
      };
    };

  flake.homeModules.university = {
    services.remmina.enable = true;
  };
}
