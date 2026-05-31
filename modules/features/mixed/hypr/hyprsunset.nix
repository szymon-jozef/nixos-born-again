{ ... }:
{
  flake.homeModules.hyprsunset =
    { ... }:
    {
      services.hyprsunset = {
        enable = true;

        settings = {
          max-gamma = 150;

          profile = [
            {
              time = "7:00";
              identity = true;
            }
            {
              time = "21:30";
              identity = false;
              temperature = 4500;
              gamma = 0.8;
            }
          ];
        };
      };
    };
}
