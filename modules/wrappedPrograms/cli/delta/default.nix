{ self, ... }:
{
  flake.wrappers.delta = {
    imports = [ ./_wrapper.nix ];
    settings = {
      delta = {
        line-numbers = true;
        features = "catppuccin-mocha";
      };
      include.path = "${./catppuccin.gitconfig}";
    };
  };
}
