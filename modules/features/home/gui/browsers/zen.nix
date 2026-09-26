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

        policies =
          let
            mkLockedAttrs = builtins.mapAttrs (
              _: value: {
                Value = value;
                Status = "locked";
              }
            );

            mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

            mkExtensionEntry =
              {
                id,
                pinned ? false,
              }:
              let
                base = {
                  install_url = mkPluginUrl id;
                  installation_mode = "force_installed";
                };
              in
              if pinned then base // { default_area = "navbar"; } else base;

            mkExtensionSettings = builtins.mapAttrs (
              _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
            );
          in
          {
            ExtensionSettings = mkExtensionSettings {
              "uBlock0@raymondhill.net" = mkExtensionEntry {
                id = "ublock-origin";
                pinned = true;
              };

              "{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtensionEntry {
                id = "bitwarden-password-manager";
                pinned = true;
              };

              "addon@darkreader.org" = mkExtensionEntry {
                id = "darkreader";
                pinned = true;
              };

              "remove-paywall@example.com" = mkExtensionEntry {
                id = "remove-paywall";
                pinned = true;
              };

              "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
              "sponsorBlocker@ajay.app" = "sponsorblock";
              "videoresumer@jetpack" = "video-resumer";
              "languagetool-webextension@languagetool.org" = "languagetool";
            };

            Preferences = mkLockedAttrs {
              "privacy.resistFingerprinting" = true;
              "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
              "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
              "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
              # "privacy.resistFingerprinting.block_mozAddonManager" = true;
              # "privacy.spoof_english" = 1;

              "privacy.firstparty.isolate" = true;
              "network.cookie.cookieBehavior" = 5;
              "dom.battery.enabled" = false;
            };
          };

        profiles.default = {
          settings = {
            "zen.tabs.vertical.right-side" = true;
            "zen.view.compact.hide-tabbar" = true;
            "zen.view.compact.hide-toolbar" = true;
            "zen.tabs.vertical" = true;
            "zen.urlbar.behavior" = "float";
            "zen.welcome-screen.seen" = false;
          };

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
                    template = "https://search.brave.com/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
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
                    template = "https://wsjp.pl/szukaj/podstawowe/wyniki?";
                    params = [
                      {
                        name = "szukaj";
                        value = "{searchTerms}";
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
                    template = "https://search.nixos.org/packages?channel=unstable";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
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
