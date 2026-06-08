{ ... }:
{
  flake.modules.homeManager.gemini =
    { ... }:
    {
      # Move this to a separate module?
      programs.antigravity-cli = {
        enable = true;
        defaultModel = "gemini-3.1-pro-preview";
        context = {
          GEMINI = ''
            # Context
            Pisz po polsku i sie nie wydurniaj.
          '';
        };
      };
    };
}
