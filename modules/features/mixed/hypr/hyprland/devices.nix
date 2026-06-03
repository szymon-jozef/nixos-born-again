{ ... }:
{
  flake.modules.homeManager.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland.settings = {
        device = [
          {
            name = "corsair-corsair-m75-gaming-mouse";
            sensitivity = -0.5;
          }
        ];
      };
    };
}
