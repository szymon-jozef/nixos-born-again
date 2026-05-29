{ ... }:
{
  flake.nixosModules.user =
    { username, pkgs, ... }:
    {
      users.users.${username} = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];
      };
    };
}
