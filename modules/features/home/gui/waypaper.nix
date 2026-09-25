{
  flake.modules.homeManager.waypaper =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        waypaper
      ];
    };
}
