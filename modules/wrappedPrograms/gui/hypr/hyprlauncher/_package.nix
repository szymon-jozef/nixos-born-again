{ pkgs, ... }:

pkgs.hyprlauncher.overrideAttrs (
  finalAttrs: previousAttrs: {
    patches = (previousAttrs.patches or [ ]) ++ [
      # TODO! Remove me, if this ever get merged
      (pkgs.fetchpatch2 {
        name = "hyprlauncher-config-flag.patch";
        url = "https://github.com/szymon-jozef/hyprlauncher/commit/bc1790a58585a3095d097413619662002cc0ddf5.patch";
        hash = "sha256-+1LLinubJOnJTdqUPV5a0gZntfwihNA/rEn+k95dfrs=";
      })
    ];
  }
)
