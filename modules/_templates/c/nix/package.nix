{ metadata, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      desktopItem = pkgs.makeDesktopItem {
        name = metadata.name;
        desktopName = metadata.name;
        exec = metadata.executable;
        comment = metadata.description;
        categories = metadata.categories;
        terminal = false;
      };
    in
    {
      packages.default = (
        with pkgs;
        stdenv.mkDerivation {
          pname = metadata.name;
          version = metadata.version;
          src = ./..;

          # build dependencies
          nativeBuildInputs = with pkgs; [
            ninja
            cmake
            copyDesktopItems
            makeWrapper
          ];

          # runtime dependencies
          buildInputs = with pkgs; [
          ];

          desktopItems = [ desktopItem ];

          postInstall = ''
            # wrap program with all env vars/whatever you want
            wrapProgram $out/bin/${metadata.executable}
          '';

          meta = {
            description = metadata.description;
            homepage = metadata.homepage_url;
            # license = lib.licenses.gpl3;
            # platforms = lib.platforms.linux;
            downloadPage = metadata.release_url;
            mainProgram = metadata.name;
          };
        }
      );
    };
}
