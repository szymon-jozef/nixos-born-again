{ ... }:
{
  flake.nixosModules.packages =
    { inputs, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kitty
        wget
        vim
        git
        ripgrep
        killall
        unzip
        wl-clipboard
        ffmpeg
        inputs.agenix.packages."${pkgs.system}".default
      ];
    };
}
