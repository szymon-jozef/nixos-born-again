{ ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        awww
        kdePackages.kwallet
        kdePackages.kwallet-pam
        kdePackages.kwalletmanager
        hyprpolkitagent
        modprobed-db
      ];
    };
}
