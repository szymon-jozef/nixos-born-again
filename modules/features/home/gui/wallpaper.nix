{ inputs, ... }:
{
  flake.homeModules.wallpaper = { pkgs, ... }: {
    services.awww = {
      enable = true;
    };

    home.packages = with pkgs; [
      waypaper
    ];

    home.file = {
      "Obrazy/tapety/catppuccin".source = inputs.wallpapers;
    };
  };
}
