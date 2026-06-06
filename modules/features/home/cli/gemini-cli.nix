{ ... }:
{
  flake.modules.homeManager.gemini =
    { ... }:
    {
      catppuccin.gemini-cli.enable = false;
      # Move this to a separate module?
      programs.antigravity-cli = {
        enable = true;
        defaultModel = "gemini-3.1-pro";
        context = {
          GEMINI = ''
            # Context
            Pisz po polsku i sie nie wydurniaj.
          '';
        };
      };
    };
}
