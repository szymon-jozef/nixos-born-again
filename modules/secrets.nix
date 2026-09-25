{
  flake.nixosModules.secrets = {
    age.secrets = {
      wifi.file = ./_secrets/wifi.age;
    };
  };
}
