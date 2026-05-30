{ ... }:
{
  flake.nixosModules.packages-virtualisation =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        winboat
        distrobox
        quickemu
      ];
    };
}
