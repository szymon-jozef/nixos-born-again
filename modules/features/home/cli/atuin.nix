{
  flake.homeModules.atuin = {
    programs.atuin = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
