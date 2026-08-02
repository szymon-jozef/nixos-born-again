{
  flake.templates = {
    empty = {
      path = ./_templates/empty;
      description = "Empty flake template using flake-parts and import tree";
    };

    cpp = {
      path = ./_templates/cpp;
      description = "C++ nix flake";
    };

    py = {
      path = ./_templates/py;
      description = "Python + uv nix flake";
    };

    rs = {
      path = ./_templates/rs;
      description = "Rust nix flake";
    };
  };
}
