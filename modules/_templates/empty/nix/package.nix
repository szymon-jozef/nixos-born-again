{ ... }:
{
  perSystem = { pkgs, ... }: {
    packages.default = (
      with pkgs;
      stdenv.mkDerivation {
        pname = "name";
        version = "0.0.1";

        src = ./..;

        meta = {
          description = "desc";
          homepage = "https://example.com";
          downloadPage = "https://example.com";
          # license = lib.licenses.gpl3;
          # platforms = lib.platforms.linux;
          mainProgram = "executable_name";
        };
      }
    );
  };
}
