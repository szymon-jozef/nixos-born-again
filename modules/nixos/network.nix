{
  flake.nixosModules = {
    network =
      { config, ... }:
      {
        networking = {
          hostName = config.system.hostname;
          networkmanager.enable = true;
        };
      };

    network-home-wifi =
      { config, ... }:
      {
        networking.networkmanager = {
          ensureProfiles = {
            environmentFiles = [ config.age.secrets.wifi.path ];

            profiles = {
              "home-nix" = {
                connection = {
                  id = "home-nix";
                  type = "wifi";
                };
                wifi.ssid = "$WIFI_HOME_SSID";
                wifi-security = {
                  key-mgmt = "wpa-psk";
                  psk = "$WIFI_HOME_PASSWORD";
                };
              };
            };
          };
        };
      };
  };
}
