{ ... }:
{
  flake.homeModules.browsers =
    { pkgs, inputs, ... }:
    {
      programs.chromium = {
        enable = true;
      };

      home.packages = with pkgs; [
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        tutanota-desktop
        brave
      ];
    };
}
