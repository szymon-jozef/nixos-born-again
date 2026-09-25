{
  flake.nixosModules.secrets = {
    age.secrets = {
      user.file = ./_secrets/user.age;
      wifi.file = ./_secrets/wifi.age;
    };
  };
}
