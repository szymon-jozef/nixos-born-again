{
  flake.nixosModules.secrets = { config, ... }: {
    age.secrets = {
      wifi.file = ./_secrets/wifi.age;
      git = {
        file = ./_secrets/git.age;
        owner = config.user.name;
        mode = "0400";
      };
    };
  };
}
