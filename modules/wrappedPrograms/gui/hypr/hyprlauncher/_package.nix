{
  pkgs,
  fetchFromGitHub,
  lib,
  ...
}:

pkgs.hyprlauncher.overrideAttrs (
  finalAttrs: previousAttrs: {
    src = fetchFromGitHub {
      owner = "szymon-jozef";
      repo = "hyprlauncher";
      rev = "bc1790a58585a3095d097413619662002cc0ddf5";
      hash = "sha256-VTfG8XQv9AUaoyruj/efxXEBBhIVq+sxocf/8XZjp3Q=";
    };
  }
)
