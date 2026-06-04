{ ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kdePackages.kwallet
        kdePackages.kwallet-pam
        kdePackages.kwalletmanager
        hyprpolkitagent
        modprobed-db
      ];
    };
}
