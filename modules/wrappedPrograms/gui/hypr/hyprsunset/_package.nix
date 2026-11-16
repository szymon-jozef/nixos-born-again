{ pkgs, ... }:
pkgs.hyprsunset.overrideAttrs (
  final: prev: {
    patches = (prev.patches or [ ]) ++ [
      # TODO! Remove me when hyprsunset gets a new release (and commit the module to nix-wrappers-modules then also!)
      (pkgs.fetchpatch2 {
        name = "hyprsunset-config-flag-fix.patch";
        url = "https://github.com/hyprwm/hyprsunset/commit/b5c0b33e78a7a625d858edb0c7f6e3fd127579ba.patch";
        hash = "sha256-S5HsCH9TKQEMR5iAws8tOqDNQcMXU5fbxw0S+CQ//Ys=";
      })
    ];
  }
)
