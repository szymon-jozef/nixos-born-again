{
  flake.homeModules.wallpaper = { pkgs, ... }: {
    services.awww = {
      enable = true;
    };

    home.packages = with pkgs; [
      waypaper
    ];
  };
}
