{ ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs.nerd-fonts; [
        fira-code
        noto
        jetbrains-mono
        ubuntu
        symbols-only
      ];
    };
}
