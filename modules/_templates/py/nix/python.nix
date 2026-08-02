{
  inputs,
  metadata,
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
              inputs.pyproject-build-systems.overlays.default # Zazwyczaj używa się .default w ekosystemie pyproject-nix
              overlay
            ]
          );
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (pythonSet.mkVirtualEnv "${metadata.project.name}-dev-env" workspace.deps.all)
          uv
        ];

        env = {
          UV_NO_SYNC = "1";
          UV_PYTHON = pythonSet.python.interpreter;
          UV_PYTHON_DOWNLOADS = "never";
        };

        shellHook = ''
          unset PYTHONPATH
          export REPO_ROOT=$(git rev-parse --show-toplevel)
        '';
      };

      packages.default = pythonSet.mkVirtualEnv "${metadata.project.name}-env" workspace.deps.default;
    };
}
