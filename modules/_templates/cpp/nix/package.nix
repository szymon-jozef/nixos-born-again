{
  perSystem =
    { pkgs, ... }:
    let
      desktopItem = pkgs.makeDesktopItem {
        name = "project";
        desktopName = "Project name";
        exec = "executable_name";
        comment = "some project";
        categories = [
          "Project"
        ];
        terminal = false;
      };
    in
    {
      packages.default = (
        with pkgs;
        stdenv.mkDerivation {
          pname = "project";
          version = builtins.head (
            builtins.match ".*VERSION\ ([0-9.]+).*" (builtins.readFile ../CMakeLists.txt)
          );

          src = ./..;

          nativeBuildInputs = with pkgs; [
            ninja
            cmake
            copyDesktopItems
            makeWrapper
            glfw3
          ];

          buildInputs = with pkgs; [
            # dependencies
          ];

          desktopItems = [ desktopItem ];

          postInstall = ''
            wrapProgram $out/bin/battleships --set BATTLESHIPS_ASSETS_DIR "$out/usr/share/battleships/assets"
          '';
        }
      );
    };
}
