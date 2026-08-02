{
  inputs,
  python-version,
  ...
}:
{
  perSystem =
    {
      lib,
      pkgs,
      ...
    }:
    let
      # translates uv.lock to nix
      workspace = inputs.uv2nix.lib.workspace.loadWorkspace { workspaceRoot = ./..; };

      overlay = workspace.mkPyprojectOverlay {
        sourcePreference = "wheel";
      };

      pythonSet =
        (pkgs.callPackage inputs.pyproject-nix.build.packages {
          python = pkgs."python${python-version}";
        }).overrideScope
          (
            lib.composeManyExtensions [
              inputs.pyproject-build-systems.overlays.default
              overlay
            ]
          );
    in
    {
      _module.args = {
        inherit workspace pythonSet;
      };
    };
}
