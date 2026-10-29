{ self, ... }: {
  flake.nixosModules.wrapped-programs-default = {
    imports = with self.nixosModules; [
      nh
      btop
      nixvim
      starship
      # fish
      fastfetch
    ];
  };
}
