{
  flake.homeModules.zen =
    { pkgs, inputs, ... }:
    {
      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser = {
        enable = true;
        setAsDefaultBrowser = true;

        profiles.default = {
          presets = {
            catppuccin = {
              enable = true;
              flavor = "Mocha";
              accent = "Sapphire";
            };

            betterfox.enable = true;
          };

          search = {
            force = true;
            default = "brave";

            engines = {
              brave = {
                name = "brave";
                urls = [
                  {
                    template = "https://search.brave.com/search?q={searchTerms}&source=web";
                    params = [
                      {
                        name = "query";
                        value = "searchTerms";
                      }
                    ];
                  }
                ];
                definedAliases = [ "@brave" ];
              };

              wsjp = {
                name = "wsjp";
                urls = [
                  {
                    template = "https://wsjp.pl/szukaj/podstawowe/wyniki?szukaj={searchTerms}";
                    params = [
                      {
                        name = "query";
                        value = "searchTerms";
                      }
                    ];
                  }
                ];
                definedAliases = [ "@wsjp" ];
              };

              nix = {
                name = "nix";
                urls = [
                  {
                    template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                    params = [
                      {
                        name = "query";
                        value = "searchTerms";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@nix" ];
              };
            };
          };
        };
      };
    };
}
