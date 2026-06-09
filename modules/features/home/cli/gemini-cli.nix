{ ... }:
{
  flake.modules.homeManager.gemini =
    { pkgs, ... }:
    {
      # Move this to a separate module?
      programs.antigravity-cli = {
        enable = true;
        package = pkgs.gemini-cli;

        defaultModel = "gemini-3.1-pro-preview";
        context = {
          GEMINI = ''
            # Context
            Pisz po polsku i sie nie wydurniaj. Odpowiadaj krótko i zwęźle, nie dopytuj niepotrzebnie.
          '';
        };
      };
    };
}
