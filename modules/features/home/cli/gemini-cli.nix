{ ... }:
{
  flake.modules.homeManager.gemini =
    { ... }:
    {
      catppuccin.gemini-cli.enable = false;
      # Move this to a separate module?
      programs.gemini-cli = {
        enable = true;
        context = {
          GEMINI = ''
            # Context
            Pisz po polsku i sie nie wydurniaj.
          '';
        };
      };
    };
}
